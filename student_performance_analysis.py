import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("student_performance_data.csv")

print("\n--- Dataset Info ---")
print(df.info())

print("\n--- Summary Statistics ---")
print(df.describe())

print("\n--- Department Performance ---")
print(df.groupby("Department")["Overall_Score"].mean().round(2))

print("\n--- Grade Distribution ---")
print(df["Grade"].value_counts())

print("\n--- Pass Rate ---")
print((df["Result"].eq("Pass").mean() * 100).round(2), "%")

print("\n--- Attendance vs Score Correlation ---")
print(df["Attendance_Percent"].corr(df["Overall_Score"]).round(3))

# Bar chart
df.groupby("Department")["Overall_Score"].mean().plot(kind="bar")
plt.title("Average Overall Score by Department")
plt.xlabel("Department")
plt.ylabel("Average Score")
plt.tight_layout()
plt.show()

# Scatter plot
plt.scatter(df["Attendance_Percent"], df["Overall_Score"])
plt.title("Attendance vs Overall Score")
plt.xlabel("Attendance %")
plt.ylabel("Overall Score")
plt.tight_layout()
plt.show()
