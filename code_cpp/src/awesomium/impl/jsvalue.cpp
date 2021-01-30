#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../jsarray.h"
#include "../webstring.h"
#include "../jsvalue.h"
#include "../jsobject.h"

namespace Awesomium
{
	class WebView;
	class JSValue;

	JSValue* JSValue::dummyjsvalue1 = new JSValue;
	JSValue* JSValue::dummyjsvalue2 = new JSValue;
	JSValue* JSValue::dummyjsvalue3 = new JSValue;
	JSObject* JSValue::dummyjsobject = new JSObject;
	JSArray* JSValue::dummyjsarray = new JSArray;
	WebString* JSValue::dummywebstring = new WebString;

	/*
	JSValue::JSValue() {};*/
	JSValue::JSValue(bool val) {};
	JSValue::JSValue(int val) {};
	JSValue::JSValue(double val) {};
	JSValue::JSValue(const WebString& val) {};
	JSValue::JSValue(const JSObject& val) {};
	JSValue::JSValue(const JSArray& val) {};
	JSValue::JSValue(const JSValue& orig) {};

	JSValue::~JSValue() {};

	JSValue& JSValue::operator=(const JSValue& rhs) { return *dummyjsvalue1; };

	const JSValue& JSValue::Undefined() { return *dummyjsvalue2; };
	const JSValue& JSValue::Null() { return *dummyjsvalue3; };

	bool JSValue::IsBoolean() const { return true; };
	bool JSValue::IsInteger() const { return true; };
	bool JSValue::IsDouble() const { return true; };
	bool JSValue::IsNumber() const { return true; };
	bool JSValue::IsString() const { return true; };
	bool JSValue::IsArray() const { return true; };
	bool JSValue::IsObject() const { return true; };
	bool JSValue::IsNull() const { return false; };
	bool JSValue::IsUndefined() const { return false; };

	WebString JSValue::ToString() const { return *dummywebstring; };
	int JSValue::ToInteger() const { return 1; };
	double JSValue::ToDouble() const { return 1; };
	bool JSValue::ToBoolean() const { return true; };
	JSArray& JSValue::ToArray() { return *dummyjsarray; };
	const JSArray& JSValue::ToArray() const { return *dummyjsarray; };

	JSObject& JSValue::ToObject() { return *dummyjsobject; };
	const JSObject& JSValue::ToObject() const { return *dummyjsobject; };

}