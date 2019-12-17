echo 'start nginx-rtmp'
nohup nginx &
nohup ffmpeg -re -i rtsp://10.2.226.201:554/video.rtsp -c:v libx264 -preset ultrafast -acodec libmp3lame -ar 44100 -ac 1 -segment_list_flags live -f flv rtmp://localhost:1935/stream/201 >>201.log 2>&1 &
nohup ffmpeg -re -i rtsp://10.2.226.202:554/video.rtsp -c:v libx264 -preset ultrafast -acodec libmp3lame -ar 44100 -ac 1 -segment_list_flags live -f flv rtmp://localhost:1935/stream/202 >>202.log 2>&1 &