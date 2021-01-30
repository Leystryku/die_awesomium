#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../jsarray.h"
#include "../jsvalue.h"

namespace Awesomium
{
	JSArray* JSArray::dummyjsarray = new JSArray;
	JSValue* JSArray::dummyjsvalue = new JSValue;

	JSArray::JSArray()
	{
	};

	JSArray::JSArray(unsigned int n)
	{
	};

	JSArray::JSArray(const JSArray& rhs)
	{
	};

	JSArray& JSArray::operator=(const JSArray& rhs)
	{
		return *dummyjsarray;
	};

	unsigned int JSArray::size() const
	{
		return 1;
	};
	unsigned int JSArray::capacity() const
	{
		return 1;
	};
	JSValue& JSArray::At(unsigned int idx)
	{
		return *dummyjsvalue;
	};
	const JSValue& JSArray::At(unsigned int idx) const
	{
		return *dummyjsvalue;
	};

	JSValue& JSArray::operator[](unsigned int idx)
	{
		return *dummyjsvalue;
	};

	const JSValue& JSArray::operator[](unsigned int idx) const
	{
		return *dummyjsvalue;
	}

	void JSArray::Push(const JSValue& item)
	{
	};

	void JSArray::Pop()
	{
	};

	void JSArray::Insert(const JSValue& item, unsigned int idx)
	{
	};

	void JSArray::Erase(unsigned int idx)
	{
	};

	void JSArray::Clear()
	{
	};
}