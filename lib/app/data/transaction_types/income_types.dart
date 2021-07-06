enum IncomeTypes {
  salary,
  sale,
  allowance,
  miscellaneous,
}

const Map<IncomeTypes, String> IncomeTypeName = {
  IncomeTypes.allowance: "Allowance",
  IncomeTypes.miscellaneous: "Miscellaneous",
  IncomeTypes.salary: "Salary",
  IncomeTypes.sale: "Sale",
};