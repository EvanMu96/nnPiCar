function [response,completedrequest,history ] = cmd( action,uri)
% ����С��ǰ������
%  action/uri���Ͷ���str,һ����Ҫִ�е�״̬����һ����Ҫpost��ȥ�ĵ�ַ
% action ��״̬�а��֣�����С������'forward' 'backward' 'turnleft' 'turn right'����
% ������̨��ת����'up' 'down' 'left' 'right'����
body = matlab.net.http.MessageBody(action);
method = matlab.net.http.RequestMethod.POST;
type1 = matlab.net.http.MediaType('*/*');
acceptField = matlab.net.http.field.AcceptField(type1);
contentTypeField = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded');
header = [acceptField contentTypeField];
request = matlab.net.http.RequestMessage(method,header,body);
[response,completedrequest,history] = send(request,uri);

end

