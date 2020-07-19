function UtilityListItemCategoryDropDown(dropDownSelector, listItemCategoryName) {
    $("#" + dropDownSelector).kendoDropDownList({
        filter: "startswith",
        optionLabel: "Select..",
        dataTextField: "ListItemName",
        dataValueField: "ListItemId",
        dataSource: {
            transport: {
                read: {
                    type: 'Get',
                    url: WebApiUri + '/UtilityApi/ListItemCategoryDetailSel',
                    data: { listItemCategoryName: listItemCategoryName},
                    dataType: 'JSON',
                    contentType: "application/json; charset=utf-8"
                }
            }
        }
    }).data("kendoDropDownList");
}
