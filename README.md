# BIWASDNN
Implementation of a fast 3-layer feed-forward neuronet model that is trained using a bio-inspired weights-and-structure-determination (BIWASD) algorithm.
BIWASD incorporates a metaheuristic optimization algorithm dubbed beetle antennae search (BAS), is used to train the BIWASD-based neura network (BIWASDNN) model.
The purpose of this package is to model and replicate the behavior of a PID controller through BIWASDNN and then to stabilize control systems through a neura network (NN) feedback controller.
Considering this problem's approach through NN, using the weight direct determination (WDD) method and given a maximum number of hidden-layer neurons, the BIWASDNN algorithm finds the optimal number of hidden-layer neurons along with the optimal power of the activation function at each hidden-layer neuron that reduces the model's error during the validation procedure.

The main articles used are the followings:
*	S.D.Mourtas, V.N.Katsikis, C. Kasimis, "Feedback Control Systems Stabilization Using a Bio-inspired Neural Network," EAI Endorsed Trans AI Robotics, vol. 1, 1-13 (2022)

# M-files Description
*	Main_BIWASDNN.m: the main function
*	problem.m: input data and parameters of the BIWASDNN
*	BIWASD.m: function for finding the optimal number of hidden-layer neurons, along with the optimal activation function power at each hidden-layer neuron
*	fitness.m: the objective function that must be minimized by BAS
*	HPNN_WASD.m: function for finding the optimal number of hidden-layer neurons
*	FTree.m: function for creating a NN model based on fine Tree method
*	SEGPR.m: function for creating a NN model based on squared exponential GPR method
*	Qmatrix.m: function for calculating the matrix Q
*	Qmatrix2.m: function for calculating the matrix Q
*	predictN.m: function for predicting
*	error_pred.m: function for calculating the coefficient of determination (R-squared), mean absolute percentage error (MAPE), mean absolute error (MAE) and root-mean-square error (RMSE) of the predicted values
*	Simulation.m: feedback controller simulation
*	tf_out.m: PID feedback controller
*	tf_out_pred.m: NN feedback controller
*	Problem_figures.m: function for the figures creation

# Installation
*	Unzip the file you just downloaded and copy the MI-BASWASDN directory to a location,e.g.,/my-directory/
*	Run Matlab, Go to /my-directory/BIWASDNN/ at the command prompt
*	run 'Main_BIWASDNN

# Results
After running the 'Main_MI_BASWASDN.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The optimal activation function power of each hidden-layer neuron.
*	The models predictions and statistics on the training and testing samples.
*	The graphic illustration of the testing and predicting performance.
*	The graphic illustration of the feedback signal.

# Environment
The BIWASDNN kit has been tested in Matlab 2021a on OS: Windows 10 64-bit.
