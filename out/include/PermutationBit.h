// Generated by Haxe 4.1.0-rc.1+0545ce110
#ifndef INCLUDED_PermutationBit
#define INCLUDED_PermutationBit

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(PermutationBit)
HX_DECLARE_CLASS2(haxe,io,Bytes)



class HXCPP_CLASS_ATTRIBUTES PermutationBit_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef PermutationBit_obj OBJ_;
		PermutationBit_obj();

	public:
		enum { _hx_ClassId = 0x0ec1764f };

		void __construct( ::haxe::io::Bytes array, ::Dynamic callBack,::Array< ::Dynamic> result);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="PermutationBit")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"PermutationBit"); }
		static hx::ObjectPtr< PermutationBit_obj > __new( ::haxe::io::Bytes array, ::Dynamic callBack,::Array< ::Dynamic> result);
		static hx::ObjectPtr< PermutationBit_obj > __alloc(hx::Ctx *_hx_ctx, ::haxe::io::Bytes array, ::Dynamic callBack,::Array< ::Dynamic> result);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~PermutationBit_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("PermutationBit",87,a7,2c,aa); }

		static void __boot();
		static int total;
		::cpp::VirtualArray result;
		 ::Dynamic callBack;
		Dynamic callBack_dyn() { return callBack;}
		int lastIndex;
		int len;
		 ::haxe::io::Bytes copyBytes( ::haxe::io::Bytes b);
		::Dynamic copyBytes_dyn();

		void heapPermutation( ::haxe::io::Bytes a,int size,int total, ::Dynamic callBack,::Array< ::Dynamic> result);
		::Dynamic heapPermutation_dyn();

};


#endif /* INCLUDED_PermutationBit */ 
