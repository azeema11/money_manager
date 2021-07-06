enum ExpenseTypes {
  food,
  utility,
  health,
  transportation,
  education,
  clothing,
  household,
  grocery,
  miscellaneous,
  personal,
  insurance,
  tax,
}

const Map<ExpenseTypes, String> ExpenseTypeName = {
  ExpenseTypes.clothing: "Clothing",
  ExpenseTypes.education: "Education",
  ExpenseTypes.food: "Food",
  ExpenseTypes.grocery: "Grocery",
  ExpenseTypes.health: "Health",
  ExpenseTypes.household: "Household",
  ExpenseTypes.transportation: "Transportation",
  ExpenseTypes.utility: "Utitility",
  ExpenseTypes.personal: "Personal",
  ExpenseTypes.insurance: "insurance",
  ExpenseTypes.tax: "Tax",
  ExpenseTypes.miscellaneous: "Miscellaneous",
};
