#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../webstring.h"
#include "../datasource.h"

namespace Awesomium
{
	DataSource::DataSource()
	{
	};

	DataSource::~DataSource()
	{
	};

	void DataSource::OnRequest(int id, const ResourceRequest& request, const WebString& path)
	{
	};

	void DataSource::SendResponse(int id, unsigned int buf, unsigned char* buff, const WebString& meme)
	{
	};

	void DataSource::SendResponse(int id, unsigned int buf, unsigned char const* buff, class WebString const& meme)
	{
	};


	void DataSource::set_session(WebSession* session, int data_source_id)
	{
	};
}