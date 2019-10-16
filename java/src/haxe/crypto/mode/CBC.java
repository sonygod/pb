// Generated by Haxe 4.0.0-rc.5+b1fb4afca
package haxe.crypto.mode;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class CBC extends haxe.lang.HxObject
{
	public CBC(haxe.lang.EmptyObject empty)
	{
	}
	
	
	public CBC()
	{
		//line 5 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		haxe.crypto.mode.CBC.__hx_ctor_haxe_crypto_mode_CBC(this);
	}
	
	
	protected static void __hx_ctor_haxe_crypto_mode_CBC(haxe.crypto.mode.CBC __hx_this)
	{
	}
	
	
	public static void encrypt(haxe.io.Bytes src, haxe.io.Bytes iv, int blockSize, haxe.lang.Function encryptBlock)
	{
		//line 9 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		haxe.io.Bytes vector = iv.sub(0, iv.length);
		//line 10 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		int i = 0;
		//line 11 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		int len = src.length;
		//line 12 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		while (( i < len ))
		{
			//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			{
				//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g = 0;
				//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g1 = blockSize;
				//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				while (( _g < _g1 ))
				{
					//line 14 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					int j = _g++;
					//line 16 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					src.b[( i + j )] = ((byte) (( ( src.b[( i + j )] & 255 ) ^ ( vector.b[j] & 255 ) )) );
				}
				
			}
			
			//line 18 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			encryptBlock.__hx_invoke4_o(0.0, src, ((double) (i) ), haxe.lang.Runtime.undefined, 0.0, src, ((double) (i) ), haxe.lang.Runtime.undefined);
			//line 20 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			vector = src.sub(i, blockSize);
			//line 21 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			i += blockSize;
		}
		
	}
	
	
	public static void decrypt(haxe.io.Bytes src, haxe.io.Bytes iv, int blockSize, haxe.lang.Function decryptBlock)
	{
		//line 27 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		int vpos = ( src.length - blockSize );
		//line 28 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		int i = src.length;
		//line 29 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
		while (( i > 0 ))
		{
			//line 31 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			i -= blockSize;
			//line 32 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			vpos -= blockSize;
			//line 34 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			decryptBlock.__hx_invoke4_o(0.0, src, ((double) (i) ), haxe.lang.Runtime.undefined, 0.0, src, ((double) (i) ), haxe.lang.Runtime.undefined);
			//line 36 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
			if (( vpos < 0 )) 
			{
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g = 0;
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g1 = blockSize;
				//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				while (( _g < _g1 ))
				{
					//line 37 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					int j = _g++;
					//line 38 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					src.b[j] = ((byte) (( ( src.b[j] & 255 ) ^ ( iv.b[j] & 255 ) )) );
				}
				
			}
			else
			{
				//line 40 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g2 = 0;
				//line 40 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				int _g11 = blockSize;
				//line 40 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
				while (( _g2 < _g11 ))
				{
					//line 40 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					int j1 = _g2++;
					//line 41 "C:\\HaxeToolkit\\haxe\\lib\\crypto\\0,3,0\\src\\haxe\\crypto\\mode\\CBC.hx"
					src.b[( i + j1 )] = ((byte) (( ( src.b[( i + j1 )] & 255 ) ^ ( src.b[( vpos + j1 )] & 255 ) )) );
				}
				
			}
			
		}
		
	}
	
	
}


