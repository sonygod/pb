// Generated by Haxe 4.1.0-rc.1+0545ce110
#ifndef INCLUDED_KLSFGEN
#define INCLUDED_KLSFGEN

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(KLSFGEN)



class HXCPP_CLASS_ATTRIBUTES KLSFGEN_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef KLSFGEN_obj OBJ_;
		KLSFGEN_obj();

	public:
		enum { _hx_ClassId = 0x3a0f90b4 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="KLSFGEN")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"KLSFGEN"); }

		inline static hx::ObjectPtr< KLSFGEN_obj > __new() {
			hx::ObjectPtr< KLSFGEN_obj > __this = new KLSFGEN_obj();
			__this->__construct();
			return __this;
		}

		inline static hx::ObjectPtr< KLSFGEN_obj > __alloc(hx::Ctx *_hx_ctx) {
			KLSFGEN_obj *__this = (KLSFGEN_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(KLSFGEN_obj), false, "KLSFGEN"));
			*(void **)__this = KLSFGEN_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~KLSFGEN_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("KLSFGEN",7c,68,a6,8a); }

		static void main();
		static ::Dynamic main_dyn();

};


#endif /* INCLUDED_KLSFGEN */ 
