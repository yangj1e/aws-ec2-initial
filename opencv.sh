sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:george-edison55/cmake-3.x
sudo apt-get update

sudo apt-get install -y build-essential cmake git pkg-config \
    libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev libgtk2.0-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libatlas-base-dev gfortran

if [ -d /mnt ] && [ ! -e /mnt/build_tmp ] ; then
  mkdir /mnt/build_tmp
  chown ubuntu /mnt/build_tmp
fi

cd /mnt/build_tmp
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.0.0

cd /mnt/build_tmp
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.0.0

cd /mnt/build_tmp/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=/mnt/build_tmp/opencv_contrib/modules \
      -D PYTHON_INCLUDE_DIR=/home/ubuntu/anaconda2/include/python2.7 \
      -D PYTHON_INCLUDE_DIR2=/home/ubuntu/anaconda2/include/python2.7 \
      -D PYTHON_LIBRARY=/home/ubuntu/anaconda2/lib/libpython2.7.so \
      -D PYTHON_PACKAGES_PATH=/home/ubuntu/anaconda2/lib/python2.7/site-packages \
      -D BUILD_EXAMPLES=ON \
      -D PYTHON2_LIBRARY=/home/ubuntu/anaconda2/lib/libpython2.7.so \
      -D BUILD_opencv_python3=OFF \
      -D BUILD_opencv_python2=ON ..

num_cores=$(nproc)
make -j $num_cores

sudo make install
sudo ldconfig

cd ~
mkdir -p ~/.local/lib/python2.7/site-packages
ln -s /usr/local/lib/python2.7/site-packages/cv2.so ~/.local/lib/python2.7/site-packages/cv2.so

# conda install -c https://conda.anaconda.org/menpo opencv3
