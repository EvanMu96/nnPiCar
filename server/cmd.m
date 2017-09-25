function [response,completedrequest,history ] = cmd( action,uri)
% 控制小车前进后退
%  action/uri类型都是str,一个是要执行的状态，另一个是要post过去的地址
% action 的状态有八种，控制小车的是'forward' 'backward' 'turnleft' 'turn right'四种
% 控制云台旋转的是'up' 'down' 'left' 'right'四种
body = matlab.net.http.MessageBody(action);
method = matlab.net.http.RequestMethod.POST;
type1 = matlab.net.http.MediaType('*/*');
acceptField = matlab.net.http.field.AcceptField(type1);
contentTypeField = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded');
header = [acceptField contentTypeField];
request = matlab.net.http.RequestMessage(method,header,body);
[response,completedrequest,history] = send(request,uri);

end

