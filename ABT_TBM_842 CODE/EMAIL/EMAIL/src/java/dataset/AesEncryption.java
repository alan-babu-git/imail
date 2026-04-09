package dataset;



import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Encoder;


public class AesEncryption {
	
	byte[] keyBytes = new byte[] {
		 	0x73, 0x2f, 0x2d, 0x33, (byte) 0xc8, 0x01, 0x73, 0x2b, 0x72,
	        0x06, 0x75, 0x6c, (byte) 0xbd, 0x44, (byte) 0xf9, (byte) 0xc1
    };
	SecretKeySpec skeySpec;
	Cipher cipher;
	public AesEncryption() {
		skeySpec = new SecretKeySpec(keyBytes, "AES");
		try {
			cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	}
	
	public String  toEncrypt(byte[] content) {
		try {
			
			byte[] utf8 = cipher.doFinal(content);
			return (new BASE64Encoder()).encode(utf8);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
