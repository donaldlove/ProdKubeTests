#!/usr/bin/env bash

KUBE_TOKEN=eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLWI3a3ZuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiIyYzEzMmQxMi0xY2I4LTExZTktOTY0Yy00MjAxMGE5YTAwMDMiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06YWRtaW4tdXNlciJ9.OtNi4Ab6WHVF6og_4Cxhfk34bTccGuTM0r2g70A_okcYx2eZnjc_9-zBMPrb0Y_x9zT2qydVIs7PVAyyhjWZPknb2w-EZGanBqfKn7qx2sgEeCCpKfsJhKRUKMkwSoz3y8ubluJw7CWngMEsylzkfpb06lm6F8xFY8xTPPvGGjSjf1vsRtnuhYb_Rf0SnC-_e7OSG6LCqzgcaqFv-i_onWhcinm-of8xeGQ_kpkIu1LMyjuY1YOG-n7zuriuKp6eUOMGhGdt1x0hlAO-6XiZHpjpm6laU6j4wPvyiryi7_JjoUjXcC04o1f7Fz9IRr5wcPwOm6DtIl4WGtfrWLORRQ

#get list of pods
curl --insecure https://35.197.229.84:6443/api/v1/pods -H "Authorization: Bearer $KUBE_TOKEN"  && \
#peek dashboard
echo "now peek Dashboard: \n"
curl --insecure https://35.197.229.84:6443/api/v1/namespaces/kube-system/pods/kubernetes-dashboard-57df4db6b-2fwtv -H "Authorization: Bearer $KUBE_TOKEN"
#dashboard port is at 31958, test it
if curl --insecure https://35.197.229.84:31958/#!/login; then echo "works"
else
	echo "not working"
fi
