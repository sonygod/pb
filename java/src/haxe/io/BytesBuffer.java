// Generated by Haxe 4.0.0-rc.5+b1fb4afca
package haxe.io;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class BytesBuffer extends haxe.lang.HxObject
{
	public BytesBuffer(haxe.lang.EmptyObject empty)
	{
	}
	
	
	public BytesBuffer()
	{
		//line 45 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		haxe.io.BytesBuffer.__hx_ctor_haxe_io_BytesBuffer(this);
	}
	
	
	protected static void __hx_ctor_haxe_io_BytesBuffer(haxe.io.BytesBuffer __hx_this)
	{
		//line 56 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		__hx_this.b = new java.io.ByteArrayOutputStream();
	}
	
	
	public java.io.ByteArrayOutputStream b;
	
	
	
	public haxe.io.Bytes getBytes()
	{
		//line 213 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		byte[] buf = this.b.toByteArray();
		//line 214 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		haxe.io.Bytes bytes = new haxe.io.Bytes(buf.length, buf);
		//line 222 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		this.b = null;
		//line 223 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		return bytes;
	}
	
	
	@Override public java.lang.Object __hx_setField(java.lang.String field, java.lang.Object value, boolean handleProperties)
	{
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		{
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			boolean __temp_executeDef1 = true;
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (( field != null )) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				switch (field.hashCode())
				{
					case 98:
					{
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						if (field.equals("b")) 
						{
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							__temp_executeDef1 = false;
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							this.b = ((java.io.ByteArrayOutputStream) (value) );
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							return value;
						}
						
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (__temp_executeDef1) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				return super.__hx_setField(field, value, handleProperties);
			}
			else
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_getField(java.lang.String field, boolean throwErrors, boolean isCheck, boolean handleProperties)
	{
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		{
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			boolean __temp_executeDef1 = true;
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (( field != null )) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				switch (field.hashCode())
				{
					case 1950049973:
					{
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						if (field.equals("getBytes")) 
						{
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							__temp_executeDef1 = false;
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "getBytes")) );
						}
						
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						break;
					}
					
					
					case 98:
					{
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						if (field.equals("b")) 
						{
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							__temp_executeDef1 = false;
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							return this.b;
						}
						
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (__temp_executeDef1) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				return super.__hx_getField(field, throwErrors, isCheck, handleProperties);
			}
			else
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_invokeField(java.lang.String field, java.lang.Object[] dynargs)
	{
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		{
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			boolean __temp_executeDef1 = true;
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (( field != null )) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				switch (field.hashCode())
				{
					case 1950049973:
					{
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						if (field.equals("getBytes")) 
						{
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							__temp_executeDef1 = false;
							//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
							return this.getBytes();
						}
						
						//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
			if (__temp_executeDef1) 
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				return super.__hx_invokeField(field, dynargs);
			}
			else
			{
				//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public void __hx_getFields(haxe.root.Array<java.lang.String> baseArr)
	{
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		baseArr.push("length");
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		baseArr.push("b");
		//line 25 "C:\\HaxeToolkit\\haxe\\std\\haxe\\io\\BytesBuffer.hx"
		super.__hx_getFields(baseArr);
	}
	
	
}


