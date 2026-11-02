import pandas as pd
df = pd.read_csv("C:/Users/Admin/OneDrive/Desktop/airlines_flights_data.csv")
df.info()  
df= df.drop(['index'],axis=1)
df.shape
df.info()
df.price.max()
df.describe()
df.airline.describe()
df. airline.value_counts()
df['class'].describe()
df['class'].value_counts()
df.duplicated().sum()
df.drop_duplicates()
df.isnull()
df.isnull().sum()
df.sort_values(by='class',ascending=False)
df['airline']=df['airline'].drop_duplicates()
df['airline'].describe()
df['airline']= df['airline'].str.capitalize()
def day_culster (day):
    if day <= 7 :
        return "1-7 days (Last Minute)"
    elif day <=14 :
        return "8-14 days"
    elif day <=30 :
        return "15-30 days"
    else :
        return "31+ days (Early)"
df['Booking_window ']=df['days_left'].apply(day_culster)
import matplotlib.pyplot as plt
df["class"].value_counts().plot.pie(autopct="%1.1f%%", startangle=90,fontsize=15,
 colors=["#2A9D8F", "#E76F51"],shadow=True
   , wedgeprops=dict(edgecolor="white", linewidth=2))
plt.ylabel("")
plt.title("classification of share" ,fontsize=12 ,fontweight="bold")
plt.show()


df["Booking_window "].value_counts().sort_index().plot.pie(autopct="%1.1f%%", startangle=90,shadow=True,
    colors=["#E76F51", "#F4A261", "#E9C46A", "#2A9D8F"],
    wedgeprops=dict(edgecolor="white", linewidth=2))
plt.title("Booking window" ,fontsize=12 ,fontweight="bold")
plt.ylabel("")
plt.show()

ax = df.groupby("Booking_window ", observed=True).price.mean().plot.bar(
    color="#2A9D8F", width=0.6, rot=0)
plt.title(" price vs Booking window" ,fontsize=12 ,fontweight="bold")
plt.show()

ax = df.groupby("airline", observed=True).price.mean().plot.line(
    color="#2A9D8F")
plt.show()

import seaborn as sns
sns.countplot(data=df, y="airline", hue="Booking_window ",palette="Set3")
plt.title("Booking window per airlines" ,fontsize=12 ,fontweight="bold")
plt.show()

ax = df["airline"].value_counts().plot.barh(color="#2A9D8F")
plt.title("flight per airline" ,fontsize=12 ,fontweight="bold")
plt.show()

avg_price=df.groupby('airline',observed=True)['price'].mean()
avg_price.plot.line(marker="o",color="#2A9D8F")
plt.title("Average price per Air line" ,fontsize=12 ,fontweight="bold")
plt.show()