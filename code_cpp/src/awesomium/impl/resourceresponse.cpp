#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../resourceresponse.h"
#include "../webstring.h"

namespace Awesomium
{

	ResourceResponse* ResourceResponse::dummyresponse = new ResourceResponse;

	ResourceResponse::ResourceResponse()
	{
	};

	ResourceResponse* ResourceResponse::Create(unsigned int num_bytes, unsigned char* buffer, const WebString& mime_type)
	{
		return dummyresponse;
	};
	ResourceResponse* ResourceResponse::Create(const WebString& file_path)
	{
		return dummyresponse;
	};

	ResourceResponse::ResourceResponse(unsigned int num_bytes, unsigned char* buffer, const WebString& mime_type)
	{

	};

	ResourceResponse::ResourceResponse(const WebString& file_path)
	{
	};

	ResourceResponse::~ResourceResponse()
	{
	};

}