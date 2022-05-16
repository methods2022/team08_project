
import pandas as pd
import seaborn as sns

# read the processed output csv into dataframe
df = pd.read_csv('../final_processed_data_output.csv', encoding='cp1252', low_memory=False)
# select the three primary features (sex, vaccine manufacturer, and adverse event) for calculating correlations
df = df[['SEX', 'VAX_MANU', 'SYMPTOM']]
# drop rows with unknown sex info (SEX is 'U')
df = df[df['SEX'] != 'U']

# use the pandas get_dummies function to make a new df with one-hot encoded features
df1 = pd.get_dummies(df, prefix_sep = "_", columns = df.columns)

# get the correlation matrix
corr = df1.corr()

# plot a heatmap for the correlation matrix
sns.heatmap(corr, cmap="YlGnBu", annot=True)

