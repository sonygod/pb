// Generated by Haxe 4.1.0-rc.1+0545ce110
#ifndef INCLUDED_tink_core_SignalTrigger
#define INCLUDED_tink_core_SignalTrigger

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_tink_core_SignalObject
#include <tink/core/SignalObject.h>
#endif
HX_DECLARE_CLASS2(tink,core,LinkObject)
HX_DECLARE_CLASS2(tink,core,SignalObject)
HX_DECLARE_CLASS2(tink,core,SignalTrigger)
HX_DECLARE_CLASS3(tink,core,_Callback,ListCell)

namespace tink{
namespace core{


class HXCPP_CLASS_ATTRIBUTES SignalTrigger_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef SignalTrigger_obj OBJ_;
		SignalTrigger_obj();

	public:
		enum { _hx_ClassId = 0x04dd487b };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="tink.core.SignalTrigger")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"tink.core.SignalTrigger"); }
		static hx::ObjectPtr< SignalTrigger_obj > __new();
		static hx::ObjectPtr< SignalTrigger_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SignalTrigger_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_("SignalTrigger",90,bb,5a,10); }

		::Array< ::Dynamic> handlers;
		void trigger( ::Dynamic event);
		::Dynamic trigger_dyn();

		int getLength();
		::Dynamic getLength_dyn();

		::Dynamic handle( ::Dynamic cb);
		::Dynamic handle_dyn();

		void clear();
		::Dynamic clear_dyn();

		::Dynamic asSignal();
		::Dynamic asSignal_dyn();

};

} // end namespace tink
} // end namespace core

#endif /* INCLUDED_tink_core_SignalTrigger */ 
