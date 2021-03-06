#! /bin/bash

# Link conf in root -> /etc/spark/2.4.1.1-3/0
#

# Import the helper method module.
wget -O /tmp/HDInsightUtilities-v01.sh -q https://hdiconfigactions.blob.core.windows.net/linuxconfigactionmodulev01/HDInsightUtilities-v01.sh && source /tmp/HDInsightUtilities-v01.sh && rm -f /tmp/HDInsightUtilities-v01.sh

fullHostName=$(hostname -f)
echo "fullHostName=$fullHostName"

cd /root
wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-without-hadoop.tgz
tar -xzf spark-2.0.0-bin-without-hadoop.tgz
cd spark-2.0.0-bin-without-hadoop
rm -r conf
ln -s /etc/spark/2.4.2.0-258/0 conf

cd ..
rm -r /usr/hdp/2.4.2.0-258/spark
mv spark-2.0.0-bin-without-hadoop /usr/hdp/2.4.2.0-258/spark 

echo "Spark 2.0 installation completed"
