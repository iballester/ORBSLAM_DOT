#File permissions 
chmod 777 /home/irene/ORB_SLAM2/TUMTools/evaluate_ate.py
chmod 777 /home/irene/ORB_SLAM2/TUMTools/evaluate_ate_scale.py
chmod 777 /home/irene/ORB_SLAM2/TUMTools/evaluate_rpe.py
chmod 777  /home/irene/ORB_SLAM2/VKITTI_tools/txt_files.py
chmod 777  /home/irene/ORB_SLAM2/TUMTools/associate.py

datasetNames=(
"03"
)

method="rgbd"
cam=""


for datasetName in "${datasetNames[@]}"



do
    dataset_path="/home/irene/Datasets/KITTI/${datasetName}"
    groundtruth_path="/home/irene/eval_kitti/data/poses_tum_c2"
    results_path="/home/irene/eval_kitti/results/tum/${method}_tum_DOTmask/${datasetName}_DOTmask_c2_dsc_scale.txt"
    > $results_path

    ate_RCNN_DOT=$(./TUMTools/evaluate_ate_scale.py $groundtruth_path/${datasetName}.txt $dataset_path/CameraTrajectory_${method}_tum_DOTmask_dsc.txt)
    ate_red="$ate_RCNN_DOT";
    (echo $ate_red) >> $results_path

done


