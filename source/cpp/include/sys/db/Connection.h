// Generated by Haxe 4.0.0-rc.5+b1fb4afca
#ifndef INCLUDED_sys_db_Connection
#define INCLUDED_sys_db_Connection

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(sys,db,Connection)
HX_DECLARE_CLASS2(sys,db,ResultSet)

namespace sys{
namespace db{


class HXCPP_CLASS_ATTRIBUTES Connection_obj {
	public:
		typedef hx::Object super;
		HX_DO_INTERFACE_RTTI;

		::Dynamic (hx::Object :: *_hx_request)(::String s); 
		static inline ::Dynamic request( ::Dynamic _hx_,::String s) {
			return (_hx_.mPtr->*( hx::interface_cast< ::sys::db::Connection_obj *>(_hx_.mPtr->_hx_getInterface(0x6e7a3d49)))->_hx_request)(s);
		}
		::String (hx::Object :: *_hx_quote)(::String s); 
		static inline ::String quote( ::Dynamic _hx_,::String s) {
			return (_hx_.mPtr->*( hx::interface_cast< ::sys::db::Connection_obj *>(_hx_.mPtr->_hx_getInterface(0x6e7a3d49)))->_hx_quote)(s);
		}
};

} // end namespace sys
} // end namespace db

#endif /* INCLUDED_sys_db_Connection */ 
