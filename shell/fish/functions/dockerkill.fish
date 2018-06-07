function dockerkill --description 'stop all docker containers, remove all docker containers, remove all docker images'
	docker kill (docker ps -q); and docker rm (docker ps -a -q); and docker rmi (docker images -q)
end
