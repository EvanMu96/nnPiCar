function [response,completedrequest,history ] = cmd( action,uri)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
body = matlab.net.http.MessageBody(action);
method = matlab.net.http.RequestMethod.POST;
type1 = matlab.net.http.MediaType('*/*');
acceptField = matlab.net.http.field.AcceptField(type1);
contentTypeField = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded');
header = [acceptField contentTypeField];
request = matlab.net.http.RequestMessage(method,header,body);
[response,completedrequest,history] = send(request,uri);

end

