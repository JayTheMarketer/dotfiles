# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.0ReFEa/dockerkill.fish @ line 2
function dockerkill --description 'stop all docker containers, remove all docker containers, remove all docker images'
	docker kill (docker ps -q);
  docker rm (docker ps -a -q); and docker rmi (docker images -q)
end
