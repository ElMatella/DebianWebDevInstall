

# Montage du disque des données

#sudo mount /dev/sdb1 /media/mmarteau/Data

#rm -r ~/Documents
#rm -r ~/Downloads
#rm -r ~/Pictures
#rm -r ~/Videos
#rm -r ~/Music

#ln -s /media/mmarteau/Data/Shared/Downloads ~/Downloads
#ln -s /media/mmarteau/Data/Shared/Pictures ~/Documents
#ln -s /media/mmarteau/Data/Shared/Pictures ~/Pictures
#ln -s /media/mmarteau/Data/Shared/Videos ~/Videos
#ln -s /media/mmarteau/Data/Shared/Music ~/Music

#echo '/dev/sdb1  /media/mmarteau/Data    ntfs    default         0       2' | sudo tee --append /etc/fstab