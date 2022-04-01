VERSION := 1.5.1
deps:
	brew install kubectl || true
	brew install helm || true
	brew install minikube || true

start:
	minikube start

reg-init:
	export HELM_EXPERIMENTAL_OCI=1
	helm pull oci://ghcr.io/eshepelyuk/apicurio-registry --version ${VERSION}
	helm upgrade -i --wait --create-namespace -n apicurio myreg apicurio-registry-${VERSION}.tgz
	kubectl port-forward service/myreg-apicurio-registry 8080:8080 --namespace apicurio

ui:
	open http://localhost:8080
