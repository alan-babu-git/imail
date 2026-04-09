/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dataset;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Admin
 */
public class HMDecryption {
    byte[] keyBytes = new byte[] {
		 	0x73, 0x2f, 0x2d, 0x33, (byte) 0xc8, 0x01, 0x73, 0x2b, 0x72,
	        0x06, 0x75, 0x6c, (byte) 0xbd, 0x44, (byte) 0xf9, (byte) 0xc1
    };
	SecretKeySpec skeySpec;
	Cipher cipher;
	public HMDecryption() {
		skeySpec = new SecretKeySpec(keyBytes, "HM");
		try {
			cipher = Cipher.getInstance("HM");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String toDeycrypt(String  encrypted) {
		try {
			byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(encrypted);
			byte[] utf8 = cipher.doFinal(dec);
			return new String(utf8, "UTF8");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
	}
}
