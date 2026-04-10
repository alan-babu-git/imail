import os, glob
base_dir = r'C:\Users\ALAN\OneDrive\Documents\ABT_TBM_842 CODE\ABT_TBM_842 CODE\EMAIL\EMAIL'
files = glob.glob(os.path.join(base_dir, '**', '*.jsp'), recursive=True) + glob.glob(os.path.join(base_dir, '**', '*.java'), recursive=True)
for f in files:
    if 'DbConfig.java' in f: continue
    with open(f, 'r', encoding='utf-8', errors='ignore') as file: c = file.read()
    # It might be spread across lines or perfectly matching string
    old_str = 'con=DriverManager.getConnection(\"jdbc:mysql://localhost:3306/spam\",\"root\",\"root\");'
    new_str = 'con=spam.DbConfig.getConnection();'
    old_class = 'Class.forName(\"com.mysql.jdbc.Driver\");'
    if old_str in c:
        c = c.replace(old_str, new_str).replace(old_class, '')
        with open(f, 'w', encoding='utf-8') as file: file.write(c)
        print('Updated: ' + f)
