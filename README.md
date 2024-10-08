# CLR-for-Li-adsorption-on-regular-Janus-TMDs
This repository provides a cluster-wise linear regression (CLR) machine learning model to predict the adsorption energies of Li on 2D materials. The training set contains 75 examples of Li adsorption energies on top of regular and Janus transition metal dichalcogenides (TMDs) at 4 different concentrations (corresponding to 4 different supercell sizes [1x1x1, 2x2x1, 3x3x1, and 4x4x1]). 

A MATLAB code which was used to calculate one of the descriptors is provided with a data.xlsx file to get the needed data from it. All other descriptors were obtained directly from DFT calculations. 

A Jupyter notebook which was used to apply the CLR model to the dataset is also provided.

This model is detailed in the paper:  
**"Comprehensive Study of Lithium Adsorption and Diffusion on Janus Mo/WXY (X, Y = S, Se, Te) Using First-Principles and Machine Learning Approaches"**  
[Read the full paper here](https://pubs.acs.org/doi/full/10.1021/acsami.1c05508).



![Predictions of adsorption energies](https://github.com/user-attachments/assets/beab4235-cdc5-4ec2-b519-bacae4e7f37f)

**Figure**: Predictions of adsorption energies from the CLR model (`Ed_pred`) versus original DFT values (`Ed_DFT`).  
- **Left plot (a)**: Categorizes data by material (color-coded) and the side of Li adsorption on Janus materials (indicated with up and down arrows). Includes data from all supercell sizes without distinction.
- **Right plot (b)**: Organizes the same data by supercell size.


