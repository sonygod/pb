// Generated by Haxe 4.0.0-rc.5+b1fb4afca
#include <hxcpp.h>

#ifndef INCLUDED_CustomTrace
#include <CustomTrace.h>
#endif
#ifndef INCLUDED_Date
#include <Date.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_81c4e1302c9e66b9_13_init,"CustomTrace","init",0x9573e8ca,"CustomTrace.init","TestSqlite.hx",13,0x10c96ea0)
HX_LOCAL_STACK_FRAME(_hx_pos_81c4e1302c9e66b9_10_init,"CustomTrace","init",0x9573e8ca,"CustomTrace.init","TestSqlite.hx",10,0x10c96ea0)

void CustomTrace_obj::__construct() { }

Dynamic CustomTrace_obj::__CreateEmpty() { return new CustomTrace_obj; }

void *CustomTrace_obj::_hx_vtable = 0;

Dynamic CustomTrace_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< CustomTrace_obj > _hx_result = new CustomTrace_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool CustomTrace_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x3e555f10;
}

void CustomTrace_obj::init(){
            		HX_BEGIN_LOCAL_FUNC_S1(hx::LocalFunc,_hx_Closure_0, ::Dynamic,oldTrace) HXARGC(2)
            		void _hx_run( ::Dynamic v, ::Dynamic pos){
            			HX_STACKFRAME(&_hx_pos_81c4e1302c9e66b9_13_init)
HXLINE(  13)			::String _hx_tmp = ((HX_("[",5b,00,00,00) + ::Date_obj::now()->toString()) + HX_("] ",23,51,00,00));
HXDLIN(  13)			::String _hx_tmp1 = (_hx_tmp + ::Std_obj::string(v));
HXDLIN(  13)			oldTrace(_hx_tmp1,pos);
            		}
            		HX_END_LOCAL_FUNC2((void))

            	HX_STACKFRAME(&_hx_pos_81c4e1302c9e66b9_10_init)
HXLINE(  11)		 ::Dynamic oldTrace = ::haxe::Log_obj::trace;
HXLINE(  12)		::haxe::Log_obj::trace =  ::Dynamic(new _hx_Closure_0(oldTrace));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(CustomTrace_obj,init,(void))


CustomTrace_obj::CustomTrace_obj()
{
}

bool CustomTrace_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"init") ) { outValue = init_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static hx::StorageInfo *CustomTrace_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *CustomTrace_obj_sStaticStorageInfo = 0;
#endif

hx::Class CustomTrace_obj::__mClass;

static ::String CustomTrace_obj_sStaticFields[] = {
	HX_("init",10,3b,bb,45),
	::String(null())
};

void CustomTrace_obj::__register()
{
	CustomTrace_obj _hx_dummy;
	CustomTrace_obj::_hx_vtable = *(void **)&_hx_dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_("CustomTrace",f4,8c,8e,8f);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &CustomTrace_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = hx::Class_obj::dupFunctions(CustomTrace_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< CustomTrace_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = CustomTrace_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = CustomTrace_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

