#!/bin/bash

printf "== Installing extra shell tools\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printf "== Installing helm plugins\n"
helm plugin install https://github.com/f3lan/helm-diff
helm plugin install https://github.com/hypnoglow/helm-s3.git

#printf "== Configuring Helm repos\n"
#helm repo add stable 						https://charts.helm.sh/stable
#helm repo add incubator 				https://charts.helm.sh/incubator
#helm repo add bitnami         	https://charts.bitnami.com/bitnami/
#helm repo add ingress-nginx   	https://kubernetes.github.io/ingress-nginx
#helm repo add autoscaler      	https://kubernetes.github.io/autoscaler
#helm repo add jetstack        	https://charts.jetstack.io/
#helm repo add prometheus      	https://prometheus-community.github.io/helm-charts
#helm repo add influxdata      	https://helm.influxdata.com/
#helm repo add external-secrets	https://external-secrets.github.io/kubernetes-external-secrets/
#helm repo add argo-helm       	https://argoproj.github.io/argo-helm
#helm repo add argo            	https://argoproj.github.io/argo-helm
#helm repo add itzg            	https://itzg.github.io/minecraft-server-charts/
#helm repo add traefik         	https://helm.traefik.io/traefik
