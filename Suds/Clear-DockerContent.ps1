function Clear-DockerContent {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker volume prune -af
    docker system prune -af
    Clear-Host
}
