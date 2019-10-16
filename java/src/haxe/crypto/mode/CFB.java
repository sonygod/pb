// Generated by Haxe 4.0.0-rc.5+b1fb4afca
package haxe.crypto.mode;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class CFB extends haxe.lang.HxObject
{
	public CFB(haxe.lang.EmptyObject empty)
	{
	}
	
	
	public CFB()
	{
		//line 5 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		haxe.crypto.mode.CFB.__hx_ctor_haxe_crypto_mode_CFB(this);
	}
	
	
	protected static void __hx_ctor_haxe_crypto_mode_CFB(haxe.crypto.mode.CFB __hx_this)
	{
	}
	
	
	public static void encrypt(haxe.io.Bytes src, haxe.io.Bytes iv, int blockSize, haxe.lang.Function encryptBlock)
	{
		//line 9 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		haxe.io.Bytes vector = iv.sub(0, iv.length);
		//line 10 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		int i = 0;
		//line 11 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		int len = src.length;
		//line 12 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		while (( i < len ))
		{
			//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			encryptBlock.__hx_invoke4_o(0.0, vector, ((double) (0) ), haxe.lang.Runtime.undefined, 0.0, vector, ((double) (0) ), haxe.lang.Runtime.undefined);
			//line 15 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			int block = ( (( ( i + blockSize ) > len )) ? (( len - i )) : (blockSize) );
			//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			{
				//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				int _g = 0;
				//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				int _g1 = block;
				//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				while (( _g < _g1 ))
				{
					//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
					int j = _g++;
					//line 18 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
					src.b[( i + j )] = ((byte) (( ( src.b[( i + j )] & 255 ) ^ ( vector.b[j] & 255 ) )) );
				}
				
			}
			
			//line 21 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			vector = src.sub(i, block);
			//line 22 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			i += blockSize;
		}
		
	}
	
	
	public static void decrypt(haxe.io.Bytes src, haxe.io.Bytes iv, int blockSize, haxe.lang.Function decryptBlock)
	{
		//line 28 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		haxe.io.Bytes vector = iv.sub(0, iv.length);
		//line 29 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		int i = 0;
		//line 30 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		int len = src.length;
		//line 31 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		haxe.io.Bytes chiperText = null;
		//line 32 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
		while (( i < len ))
		{
			//line 34 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			decryptBlock.__hx_invoke4_o(0.0, vector, ((double) (0) ), haxe.lang.Runtime.undefined, 0.0, vector, ((double) (0) ), haxe.lang.Runtime.undefined);
			//line 35 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			int block = ( (( ( i + blockSize ) > len )) ? (( len - i )) : (blockSize) );
			//line 36 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			chiperText = src.sub(i, block);
			//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			{
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				int _g = 0;
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				int _g1 = block;
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
				while (( _g < _g1 ))
				{
					//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
					int j = _g++;
					//line 39 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
					src.b[( i + j )] = ((byte) (( ( src.b[( i + j )] & 255 ) ^ ( vector.b[j] & 255 ) )) );
				}
				
			}
			
			//line 42 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			vector = chiperText.sub(0, chiperText.length);
			//line 43 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CFB.hx"
			i += blockSize;
		}
		
	}
	
	
}


