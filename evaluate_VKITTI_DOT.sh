#File permissions 
chmod 777 /home/irene/ORB_SLAM2/TUMTools/evaluate_ate.py
chmod 777 /home/irene/ORB_SLAM2/TUMTools/evaluate_rpe.py
chmod 777  /home/irene/ORB_SLAM2/VKITTI_tools/txt_files.py
chmod 777  /home/irene/ORB_SLAM2/TUMTools/associate.py

datasetNames=(
"VKITTI_s1_c0_morning"
"VKITTI_s2_c0_morning"
"VKITTI_s6_c0_morning"
"VKITTI_s18_c0_morning"
"VKITTI_s20_c0_morning")

for datasetName in "${datasetNames[@]}"

do
    dataset_path="/home/irene/Datasets/${datasetName}"
    results_path="/home/irene/Results/${datasetName}_results.txt"
    > $results_path

    ate_RCNN=$(./TUMTools/evaluate_ate.py $dataset_path/groundtruth.txt $dataset_path/CameraTrajectory_mask_RCNN.txt)
    ate_RCNN_DOT=$(./TUMTools/evaluate_ate.py $dataset_path/groundtruth.txt $dataset_path/CameraTrajectory_mask_DOT_RCNN.txt)
    ate_red="$ate_RCNN $ate_RCNN_DOT";
    (echo $ate_red) >> $results_path


done
