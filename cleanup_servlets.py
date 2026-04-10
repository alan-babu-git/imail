import os
import glob
import re

path = r'C:\Users\ALAN\OneDrive\Documents\ABT_TBM_842 CODE\ABT_TBM_842 CODE\EMAIL\EMAIL\src\java\spam'
java_files = glob.glob(os.path.join(path, '*.java'))

for f_path in java_files:
    if 'DbConfig.java' in f_path:
        continue
    
    with open(f_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 1. Remove ClassNotFoundException and SQLException from throws clauses
    # We want to match: throws ... ClassNotFoundException, SQLException ... {
    # and variations.
    
    # Remove with leading comma
    content = re.sub(r',\s*ClassNotFoundException', '', content)
    content = re.sub(r',\s*SQLException', '', content)
    
    # Remove if it's the only one or at start of list
    content = re.sub(r'throws\s*ClassNotFoundException\s*,', 'throws ', content)
    content = re.sub(r'throws\s*SQLException\s*,', 'throws ', content)
    
    # Remove if it's the last/only one
    content = re.sub(r'throws\s*ClassNotFoundException\s*\{', 'throws {', content)
    content = re.sub(r'throws\s*SQLException\s*\{', 'throws {', content)
    
    # Handle the case where throws becomes empty: "throws {"
    # Actually HttpServlet methods still throw ServletException, IOException usually.
    
    # 2. Fix dangling try blocks in doGet/doPost
    # Pattern: try { processRequest(request, response); }
    # with no catch/finally following (or even if there is an empty catch, we want it clean)
    
    # Fix 'try { processRequest(request, response); }' to just 'processRequest(request, response);'
    content = re.sub(r'try\s*\{\s*processRequest\(\s*request\s*,\s*response\s*\);\s*\}', r'processRequest(request, response);', content)
    
    # Sometimes there might be an empty catch leftover: catch (Exception e) { }
    # But for now, let's just ensure the try is gone around processRequest calls in doGet/doPost.
    
    with open(f_path, 'w', encoding='utf-8') as f:
        f.write(content)

print("Servlet cleanup complete.")
