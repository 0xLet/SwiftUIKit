# CollectionView

``` swift
@available(iOS 11, *) public class CollectionView: UICollectionView
```

## Inheritance

`UICollectionView`, `UICollectionViewDataSource`, `UICollectionViewDelegate`, `UICollectionViewDelegateFlowLayout`

## Initializers

### `init(initialData:)`

``` swift
public init(initialData: [[CellDisplayable]] = [[CellDisplayable]]())
```

## Properties

### `data`

``` swift
var data: [[CellDisplayable]]
```

## Methods

### `set(delegateTo:)`

Set a new delegate for CollectionView.
All modifiers depending on delegate will do nothing after calling that.

``` swift
@discardableResult func set(delegateTo delegate: UICollectionViewDelegate) -> Self
```

### `set(dataSourceTo:)`

Set a new delegate for CollectionView.
All modifiers depending on data source will do nothing after calling that.

``` swift
@discardableResult func set(dataSourceTo dataSource: UICollectionViewDataSource) -> Self
```

### `set(layout:)`

Set a new layout for collection view.

``` swift
@discardableResult func set(layout: UICollectionViewLayout) -> Self
```

### `update(shouldReloadData:_:)`

``` swift
@discardableResult func update(shouldReloadData: Bool = false, _ closure: ([[CellDisplayable]]) -> [[CellDisplayable]]) -> Self
```

### `append(shouldReloadData:_:)`

``` swift
@discardableResult func append(shouldReloadData: Bool = false, _ closure: () -> [[CellDisplayable]]) -> Self
```

### `prefetchingEnabled(_:)`

``` swift
@discardableResult func prefetchingEnabled(_ bool: Bool) -> Self
```

### `prefetchDataSource(_:)`

``` swift
@discardableResult func prefetchDataSource(_ prefetchDataSource: () -> (UICollectionViewDataSourcePrefetching)) -> Self
```

### `register(cells:)`

``` swift
@discardableResult func register(cells: [CollectionViewCell.Type]) -> Self
```

### `insertItems(at:)`

``` swift
@discardableResult func insertItems(at indexPaths: [IndexPath]) -> Self
```

### `insertItem(at:)`

``` swift
@discardableResult func insertItem(at indexPath: IndexPath) -> Self
```

### `moveItem(at:to:)`

``` swift
@discardableResult func moveItem(at sourceIndexPath: IndexPath, to targetIndexPath: IndexPath) -> Self
```

### `moveItems(at:to:)`

``` swift
@discardableResult func moveItems(at sourceIndexPaths: [IndexPath], to targetIndexPaths: [IndexPath]) -> Self
```

### `deleteItem(at:)`

``` swift
@discardableResult func deleteItem(at indexPath: IndexPath) -> Self
```

### `deleteItems(at:)`

``` swift
@discardableResult func deleteItems(at indexPaths: [IndexPath]) -> Self
```

### `scrollToItem(at:at:animated:)`

``` swift
@discardableResult func scrollToItem(at indexPath: IndexPath, at position: UICollectionView.ScrollPosition, animated: Bool = true) -> Self
```

### `allowSelection(_:multiple:)`

``` swift
@discardableResult func allowSelection(_ bool: Bool, multiple: Bool = false) -> Self
```

### `selectItem(at:animated:scrollPosition:)`

``` swift
@discardableResult func selectItem(at indexPath: IndexPath, animated: Bool, scrollPosition: UICollectionView.ScrollPosition) -> Self
```

### `deselectItem(at:animated:)`

``` swift
@discardableResult func deselectItem(at indexPath: IndexPath, animated: Bool) -> Self
```

### `insertSections(at:)`

``` swift
@discardableResult func insertSections(at indexSet: IndexSet) -> Self
```

### `moveSection(from:to:)`

``` swift
@discardableResult func moveSection(from section: Int, to newSection: Int) -> Self
```

### `deleteSections(at:)`

``` swift
@discardableResult func deleteSections(at sections: IndexSet) -> Self
```

### `set(backgroundView:)`

``` swift
@discardableResult func set(backgroundView: UIView) -> Self
```

### `setNumberOfItemsInSection(handler:)`

``` swift
@discardableResult func setNumberOfItemsInSection(handler: @escaping ((UICollectionView, Int) -> Int)) -> Self
```

#### Parameters

  - handler: Contains actually declared collection view and given section, expects to return number of items for given section.

### `configureCell(handler:)`

``` swift
@discardableResult func configureCell(handler: @escaping ((UICollectionView, IndexPath) -> UICollectionViewCell)) -> Self
```

### `setSectionTitles(shouldReloadData:to:)`

Set index titles for CollectionView

``` swift
@discardableResult func setSectionTitles(shouldReloadData: Bool = false, to array: [String]) -> Self
```

#### Parameters

  - array: Used to provide titles for Collection View, order used is the same as the order of parameter.

### `numberOfSections(in:)`

``` swift
public func numberOfSections(in collectionView: UICollectionView) -> Int
```

### `collectionView(_:numberOfItemsInSection:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
```

### `collectionView(_:cellForItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
```

### `indexTitles(for:)`

``` swift
public func indexTitles(for collectionView: UICollectionView) -> [String]?
```

### `collectionView(_:indexPathForIndexTitle:at:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
```

### `shouldSelectItem(_:)`

``` swift
@discardableResult func shouldSelectItem(_ handler: @escaping ((IndexPath) -> Bool)) -> Self
```

### `didSelectItemAt(_:)`

``` swift
@discardableResult func didSelectItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self
```

### `shouldDeselectItemAt(_:)`

``` swift
@discardableResult func shouldDeselectItemAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self
```

### `didDeselectItemAt(_:)`

``` swift
@discardableResult func didDeselectItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self
```

### `shouldBeginMultipleSelectionInteractionAt(_:)`

``` swift
@discardableResult func shouldBeginMultipleSelectionInteractionAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self
```

### `didBeginMultipleSelectionInteractionAt(_:)`

``` swift
@discardableResult func didBeginMultipleSelectionInteractionAt(_ handler: @escaping ((IndexPath) -> ())) -> Self
```

### `didEndMultipleSelectionSelectionInteraction(_:)`

``` swift
@discardableResult func didEndMultipleSelectionSelectionInteraction(_ handler: @escaping ((UICollectionView) -> ())) -> Self
```

### `shouldHighlightItemAt(_:)`

``` swift
@discardableResult func shouldHighlightItemAt(_ handler: @escaping ((IndexPath) -> Bool)) -> Self
```

### `didHighlightItemAt(_:)`

``` swift
@discardableResult func didHighlightItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self
```

### `didUnhighlightItemAt(_:)`

``` swift
@discardableResult func didUnhighlightItemAt(_ handler: @escaping ((IndexPath) -> ())) -> Self
```

### `willDisplayCellHandlerFor(_:)`

``` swift
@discardableResult func willDisplayCellHandlerFor(_ handler: @escaping ((CollectionViewCell, IndexPath) -> ())) -> Self
```

### `didEndDisplayingCellFor(_:)`

``` swift
@discardableResult func didEndDisplayingCellFor(_ handler: @escaping ((CollectionViewCell, IndexPath) -> ())) -> Self
```

### `transitionLayoutFor(_:)`

``` swift
@discardableResult func transitionLayoutFor(_ handler: @escaping (_ old: UICollectionViewLayout, _ new: UICollectionViewLayout) -> UICollectionViewTransitionLayout) -> Self
```

### `targetContentOffsetFor(_:)`

``` swift
@discardableResult func targetContentOffsetFor(_ handler: @escaping (_ proposed: CGPoint) -> CGPoint) -> Self
```

### `targetIndexPathForMove(_:)`

``` swift
@discardableResult func targetIndexPathForMove(_ handler: @escaping (_ from: IndexPath, _ to: IndexPath) -> IndexPath) -> Self
```

### `canFocusItemAt(_:)`

``` swift
@discardableResult func canFocusItemAt(_ handler: @escaping (IndexPath) -> Bool) -> Self
```

### `collectionView(_:shouldSelectItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
```

### `collectionView(_:didSelectItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
```

### `collectionView(_:shouldDeselectItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
```

### `collectionView(_:didDeselectItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
```

### `collectionView(_:shouldBeginMultipleSelectionInteractionAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool
```

### `collectionView(_:didBeginMultipleSelectionInteractionAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath)
```

### `collectionViewDidEndMultipleSelectionInteraction(_:)`

``` swift
public func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView)
```

### `collectionView(_:shouldHighlightItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
```

### `collectionView(_:didHighlightItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
```

### `collectionView(_:didUnhighlightItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)
```

### `collectionView(_:willDisplay:forItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
```

### `collectionView(_:didEndDisplaying:forItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
```

### `collectionView(_:transitionLayoutForOldLayout:newLayout:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout
```

### `collectionView(_:targetContentOffsetForProposedContentOffset:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint
```

### `collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath
```

### `collectionView(_:canFocusItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool
```

### `layoutSizeForItem(_:)`

``` swift
@discardableResult func layoutSizeForItem(_ handler: @escaping ((UICollectionViewLayout,  IndexPath) -> CGSize)) -> Self
```

### `sectionInsets(shouldUpdate:insets:)`

``` swift
@discardableResult func sectionInsets(shouldUpdate: Bool = true, insets: [UIEdgeInsets]) -> Self
```

### `minimumLineSpacing(shouldUpdate:forSections:)`

``` swift
@discardableResult func minimumLineSpacing(shouldUpdate: Bool = true, forSections spacings: [CGFloat]) -> Self
```

### `minimumInteritemSpacing(shouldUpdate:forSections:)`

``` swift
@discardableResult func minimumInteritemSpacing(shouldUpdate: Bool = true, forSections spacings: [CGFloat]) -> Self
```

### `headerSize(shouldUpdate:forSections:)`

``` swift
@discardableResult func headerSize(shouldUpdate: Bool = true, forSections sizes: [CGSize]) -> Self
```

### `footerSize(shouldUpdate:forSections:)`

``` swift
@discardableResult func footerSize(shouldUpdate: Bool = true, forSections sizes: [CGSize]) -> Self
```

### `collectionView(_:layout:sizeForItemAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
```

### `collectionView(_:layout:insetForSectionAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
```

### `collectionView(_:layout:minimumLineSpacingForSectionAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
```

### `collectionView(_:layout:minimumInteritemSpacingForSectionAt:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
```

### `collectionView(_:layout:referenceSizeForHeaderInSection:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
```

### `collectionView(_:layout:referenceSizeForFooterInSection:)`

``` swift
public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
```
