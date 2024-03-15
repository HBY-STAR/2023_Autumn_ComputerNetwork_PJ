#!/bin/bash

num_iterations=5

sync

echo ==================http1====================== >result.txt
echo ==================http1====================== 

for ((i=1; i<=$num_iterations; i++)); do
	echo "-------------Running iteration $i--------------" >> result.txt
	echo "-------------Running iteration $i--------------"
	# 1 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-100KB.jpg --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---100KB: $execution_time seconds" >> result.txt
	wait
	# end

	# 2 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-1MB.png --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---1MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 3 start
	start_time=$(date +%s.%N);
	curl -k --http1.1 https://111.229.132.28:80/speed-test-5MB.jpg --output test.jpg
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---5MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 4 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-small.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---small: $execution_time seconds" >> result.txt
	wait
	# end

	# 5 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-medium.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---medium: $execution_time seconds" >> result.txt
	wait
	# end

	# 6 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-large.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http1.1---large: $execution_time seconds" >> result.txt
	wait
	# end
	
	echo "-----------------------------------------------" >> result.txt
	echo "-----------------------------------------------"
	wait
done

echo ============================================= >>result.txt
echo =============================================
wait



echo ==================http2====================== >>result.txt
echo ==================http2======================

for ((i=1; i<=$num_iterations; i++)); do
	echo "-------------Running iteration $i--------------" >> result.txt
	echo "-------------Running iteration $i--------------"

	# 1 start
	start_time=$(date +%s.%N)
	curl -k --http2 https://111.229.132.28:443/speed-test-100KB.png --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---100KB: $execution_time seconds" >> result.txt
	wait
	# end

	# 2 start
	start_time=$(date +%s.%N)
	curl -k --http2 https://111.229.132.28:443/speed-test-1MB.png --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---1MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 3 start
	start_time=$(date +%s.%N)
	curl -k --http2 https://111.229.132.28:443/speed-test-5MB.jpg --output test.jpg
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---5MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 4 start
	start_time=$(date +%s.%N)
	curl -k --http2 https://111.229.132.28:443/speed-test-small.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---small: $execution_time seconds" >> result.txt
	wait
	# end

	# 5 start
	start_time=$(date +%s.%N)
	curl -k --http1.1 https://111.229.132.28:80/speed-test-medium.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---medium: $execution_time seconds" >> result.txt
	wait
	# end

	# 6 start
	start_time=$(date +%s.%N)
	curl -k --http2 https://111.229.132.28:443/speed-test-large.html --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http2---large: $execution_time seconds" >> result.txt
	wait
	# end
	
	echo "-----------------------------------------------" >> result.txt
	echo "-----------------------------------------------"
done

echo ============================================= >>result.txt
echo ============================================= 
wait



echo ==================http3====================== >>result.txt
echo ==================http3======================

for ((i=1; i<=$num_iterations; i++)); do
	echo "-------------Running iteration $i--------------" >> result.txt
	echo "-------------Running iteration $i--------------"

	# 1 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-100KB.png --http3-only --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---100KB: $execution_time seconds" >> result.txt
	wait
	# end

	# 2 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-1MB.png --http3-only --output test.png
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---1MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 3 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-5MB.jpg --http3-only --output test.jpg
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---5MB: $execution_time seconds" >> result.txt
	wait
	# end

	# 4 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-small.html --http3-only --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---small: $execution_time seconds" >> result.txt
	wait
	# end

	# 5 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-medium.html --http3-only --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---medium: $execution_time seconds" >> result.txt
	wait
	# end

	# 6 start
	start_time=$(date +%s.%N)
	docker run -it --rm ymuski/curl-http3 curl https://netcomm.aerber.cn:8443/speed-test-large.html --http3-only --output test.html
	wait
	end_time=$(date +%s.%N)
	execution_time=$(echo "$end_time - $start_time" | bc)
	echo "http3---large: $execution_time seconds" >> result.txt
	wait
	# end
	
	echo "-----------------------------------------------" >> result.txt
	echo "-----------------------------------------------"
done

echo ============================================= >>result.txt
echo =============================================
wait

# head
echo ===================http1==================== 1>head.txt;
echo ===================http1====================
curl -k --http1.1 https://111.229.132.28:80/speed-test-100KB.png --head	1>>head.txt;
wait
curl -k --http1.1 https://111.229.132.28:80/speed-test-1MB.png --head	1>>head.txt;
wait
curl -k --http1.1 https://111.229.132.28:80/speed-test-5MB.jpg --head	1>>head.txt;
wait
curl -k --http1.1 https://111.229.132.28:80/speed-test-small.html --head	1>>head.txt;
wait
curl -k --http1.1 https://111.229.132.28:80/speed-test-medium.html --head	1>>head.txt;
wait
curl -k --http1.1 https://111.229.132.28:80/speed-test-large.html --head 1>>head.txt;
wait
echo ============================================ 1>>head.txt;
echo ============================================


echo ===================http2==================== 1>>head.txt;
echo ===================http2====================
curl -k --http2 https://111.229.132.28:443/speed-test-100KB.png --head	1>>head.txt;
wait
curl -k --http2 https://111.229.132.28:443/speed-test-1MB.png --head	1>>head.txt;
wait
curl -k --http2 https://111.229.132.28:443/speed-test-5MB.jpg --head	1>>head.txt;
wait
curl -k --http2 https://111.229.132.28:443/speed-test-small.html --head	1>>head.txt;
wait
curl -k --http2 https://111.229.132.28:443/speed-test-medium.html --head	1>>head.txt;
wait
curl -k --http2 https://111.229.132.28:443/speed-test-large.html --head 1>>head.txt;
wait
echo ============================================ 1>>head.txt;
echo ============================================


echo ===================http3==================== 1>>head.txt;
echo ===================http3==================== 
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-100KB.png --http3-only --head 1>>head.txt;	
wait
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-1MB.png --http3-only  --head	 1>>head.txt;
wait
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-5MB.jpg --http3-only  --head	1>>head.txt;
wait
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-small.html --http3-only  --head 1>>head.txt;
wait
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-medium.html --http3-only  --head  1>>head.txt;	
wait
docker run -it --rm ymuski/curl-http3 curl -IL https://netcomm.aerber.cn:8443/speed-test-large.html --http3-only  --head 1>>head.txt;
wait
echo ============================================ 1>>head.txt;
echo ============================================


