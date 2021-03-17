# TableView

``` swift
@available(iOS 11.0, *) public class TableView: UITableView
```

## Inheritance

`UITableView`, `UITableViewDataSource`, `UITableViewDelegate`

## Initializers

### `init(initalData:style:)`

``` swift
public init(initalData: [[CellDisplayable]] = [[CellDisplayable]](), style: UITableView.Style = .plain)
```

## Properties

### `data`

``` swift
var data: [[CellDisplayable]]
```

## Methods

### `update(shouldReloadData:_:)`

``` swift
@discardableResult func update(shouldReloadData: Bool = false, _ closure: ([[CellDisplayable]]) -> [[CellDisplayable]]) -> Self
```

### `append(shouldReloadData:_:)`

``` swift
@discardableResult func append(shouldReloadData: Bool = false, _ closure: () -> [[CellDisplayable]]) -> Self
```

### `numberOfSections(in:)`

``` swift
public func numberOfSections(in tableView: UITableView) -> Int
```

### `tableView(_:numberOfRowsInSection:)`

``` swift
public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

### `tableView(_:indentationLevelForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int
```

### `tableView(_:cellForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

### `tableView(_:heightForHeaderInSection:)`

``` swift
public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
```

### `tableView(_:heightForFooterInSection:)`

``` swift
public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
```

### `tableView(_:viewForHeaderInSection:)`

``` swift
public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
```

### `tableView(_:viewForFooterInSection:)`

``` swift
public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
```

### `tableView(_:canEditRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:canMoveRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:canFocusRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:shouldHighlightRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:shouldIndentWhileEditingRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:shouldShowMenuForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool
```

### `tableView(_:editingStyleForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
```

### `tableView(_:titleForDeleteConfirmationButtonForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
```

### `tableView(_:editActionsForRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
```

### `tableView(_:commit:forRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
```

### `tableView(_:didSelectRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
```

### `tableView(_:didDeselectRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
```

### `tableView(_:willBeginEditingRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath)
```

### `tableView(_:didEndEditingRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)
```

### `tableView(_:didHighlightRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)
```

### `tableView(_:didUnhighlightRowAt:)`

``` swift
public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
```

### `tableView(_:moveRowAt:to:)`

``` swift
public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
```

### `tableView(_:leadingSwipeActionsConfigurationForRowAt:)`

``` swift
@available(iOS 11.0, *) public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
```

### `tableView(_:trailingSwipeActionsConfigurationForRowAt:)`

``` swift
@available(iOS 11.0, *) public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
```

### `set(dataSource:)`

``` swift
@discardableResult func set(dataSource: UITableViewDataSource) -> Self
```

### `set(delegate:)`

``` swift
@discardableResult func set(delegate: UITableViewDelegate) -> Self
```

### `register(cells:)`

``` swift
@discardableResult func register(cells: [TableViewCell.Type]) -> Self
```

### `headerView(_:)`

``` swift
@discardableResult func headerView(_ handler: @escaping TableHeaderFooterViewHandler) -> Self
```

### `footerView(_:)`

``` swift
@discardableResult func footerView(_ handler: @escaping TableHeaderFooterViewHandler) -> Self
```

### `headerHeight(_:)`

``` swift
@discardableResult func headerHeight(_ handler: @escaping (Int) -> CGFloat) -> Self
```

### `footerHeight(_:)`

``` swift
@discardableResult func footerHeight(_ handler: @escaping (Int) -> CGFloat) -> Self
```

### `indentationLevelForRowAtIndexPath(_:)`

``` swift
@discardableResult func indentationLevelForRowAtIndexPath(_ handler: @escaping (IndexPath) -> Int) -> Self
```

### `canEditRowAtIndexPath(_:)`

``` swift
@discardableResult func canEditRowAtIndexPath(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `canMoveRowAtIndexPath(_:)`

``` swift
@discardableResult func canMoveRowAtIndexPath(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `canFocusRowAtIndexPath(_:)`

``` swift
@discardableResult func canFocusRowAtIndexPath(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `shouldHighlightRow(_:)`

``` swift
@discardableResult func shouldHighlightRow(_ handler: @escaping TableHighlightIndexPathHandler) -> Self
```

### `shouldIndentWhileEditingRowAtIndexPath(_:)`

``` swift
@discardableResult func shouldIndentWhileEditingRowAtIndexPath(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `shouldShowMenuForRowAtIndexPath(_:)`

``` swift
@discardableResult func shouldShowMenuForRowAtIndexPath(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `editingStyleForRowAtIndexPath(_:)`

``` swift
@discardableResult func editingStyleForRowAtIndexPath(_ handler: @escaping (IndexPath) -> UITableViewCell.EditingStyle) -> Self
```

### `titleForDeleteConfirmationButtonForRowAtIndexPath(_:)`

``` swift
@discardableResult func titleForDeleteConfirmationButtonForRowAtIndexPath(_ handler: @escaping (IndexPath) -> String) -> Self
```

### `editActionsForRowAtIndexPath(_:)`

``` swift
@discardableResult func editActionsForRowAtIndexPath(_ handler: @escaping (IndexPath) -> [UITableViewRowAction]) -> Self
```

### `commitEditingStyleForRowAtIndexPath(_:)`

``` swift
@discardableResult func commitEditingStyleForRowAtIndexPath(_ handler: @escaping (UITableViewCell.EditingStyle, IndexPath) -> Void) -> Self
```

### `didSelectRow(_:)`

``` swift
@discardableResult func didSelectRow(_ handler: @escaping TableDidSelectIndexPathHandler) -> Self
```

### `didDeselectRowAtIndexPath(_:)`

``` swift
@discardableResult func didDeselectRowAtIndexPath(_ handler: @escaping (IndexPath) -> Void) -> Self
```

### `willBeginEditingRowAtIndexPath(_:)`

``` swift
@discardableResult func willBeginEditingRowAtIndexPath(_ handler: @escaping (IndexPath) -> Void) -> Self
```

### `didEndEditingRowAtIndexPath(_:)`

``` swift
@discardableResult func didEndEditingRowAtIndexPath(_ handler: @escaping (IndexPath?) -> Void) -> Self
```

### `didHighlightRowAtIndexPath(_:)`

``` swift
@discardableResult func didHighlightRowAtIndexPath(_ handler: @escaping (IndexPath) -> Void) -> Self
```

### `didUnhighlightRowAtIndexPath(_:)`

``` swift
@discardableResult func didUnhighlightRowAtIndexPath(_ handler: @escaping (IndexPath) -> Void) -> Self
```

### `moveRowAtSourceIndexPathToDestinationIndexPath(_:)`

``` swift
@discardableResult func moveRowAtSourceIndexPathToDestinationIndexPath(_ handler: @escaping (IndexPath, IndexPath) -> Void) -> Self
```

### `leadingSwipeActionsConfigurationForRowAtIndexPath(_:)`

``` swift
@discardableResult func leadingSwipeActionsConfigurationForRowAtIndexPath(_ handler: @escaping (IndexPath) -> UISwipeActionsConfiguration) -> Self
```

### `trailingSwipeActionsConfigurationForRowAtIndexPath(_:)`

``` swift
@discardableResult func trailingSwipeActionsConfigurationForRowAtIndexPath(_ handler: @escaping (IndexPath) -> UISwipeActionsConfiguration) -> Self
```
