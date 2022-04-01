deps:
	brew install kubectl || true
	brew install helm || true
	brew install minikube || true

start:
	minikube start
