// Generated by Haxe 4.0.0+ef18b627e
#ifndef INCLUDED_haxe_MainEvent
#define INCLUDED_haxe_MainEvent

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxe,MainEvent)

namespace haxe{


class HXCPP_CLASS_ATTRIBUTES MainEvent_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef MainEvent_obj OBJ_;
		MainEvent_obj();

	public:
		enum { _hx_ClassId = 0x7ec59813 };

		void __construct( ::Dynamic f,int p);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="haxe.MainEvent")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"haxe.MainEvent"); }
		static hx::ObjectPtr< MainEvent_obj > __new( ::Dynamic f,int p);
		static hx::ObjectPtr< MainEvent_obj > __alloc(hx::Ctx *_hx_ctx, ::Dynamic f,int p);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~MainEvent_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("MainEvent",01,71,3b,31); }

		 ::Dynamic f;
		Dynamic f_dyn() { return f;}
		 ::haxe::MainEvent prev;
		 ::haxe::MainEvent next;
		bool isBlocking;
		Float nextRun;
		int priority;
		void delay( ::Dynamic t);
		::Dynamic delay_dyn();

		void stop();
		::Dynamic stop_dyn();

};

} // end namespace haxe

#endif /* INCLUDED_haxe_MainEvent */ 
