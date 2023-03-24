# List와 Grid, 더 나아가기

## Data Issue
- 기존의 구현 방식은 Data-> Controller -> UI에게 변경을 알리는 순서였음
- 하지만, 점점 복잡한 구현을 요구함에 따라 Controller와 UI 간의 데이터 불일치 문제가 발생함

## Single Source Of Truth Data의 필요성
- Data Issue가 생기는 이유는 대부분 Controller와 UI가 각각 데이터를 가지고 있는 것에서 시작함
- 데이터가 일치하지 않는 경우를 비롯하여, 참(True)인지의 여부를 알기가 어렵다는 추가적 문제가 있음
- 따라서, 참인 데이터를 하나만 두는 Diffable DataSource(달라질 수 있는 능력)


## DataSource vs Diffable DataSource?

### DataSource 방식과 문제점
    - View의 데이터를 구성하기 위해, Controller에게 numberOfSection, cellForItemAt 등 Data 자체의 속성을 가져와 선언함
    - 하지만 Section의 수가 잘못되거나, 차이가 나면 런타임 에러가 발생하게 되는데, 이를 해결하기 위해 보통은 '수동'으로 데이터 변경상황을 관리하거나, 동기화 메서드(reloadData() 또는 performBatchUpdates())를 이용하여 해결해옴
    - 문제는 여기서 발생! reloadData() 메서드는 해당 View를 일괄적으로 업데이트 하므로, UX(사용자 경험) 측면에서 매우 자연스럽지 않음! (뚝뚝 끊겨서 보이는 등)

### 그래서, Diffable DataSource를 사용하는거구나? 
    - 이 새로운 방식은 'Hash Value'가 주요 핵심임
    - Hash Value란, 데이터를 단순한 숫자로 표현하는 방식이며, 이를 '해쉬값'이라고 함
    - IndexPath를 사용하지 않고, 해당 아이템(데이터)의 유니크한 Unique ID를 활용함

<br>
---
<br>

## Layout Issue
- UICollectionView를 예로 들자면, Layout을 결정할 때 UICollectionViewFlowLayout을 활용해 옴
- 하지만, 이는 대부분 단순 디자인(높이, 너비가 동일한 Cell을 나열하는 등)에만 해당되는 기능임
- 결과적으로, 좀 더 복잡한 디자인, 레이아웃을 구현하기 위해선 다른 방식을 활용해야 함

## Compositional Layout
- 기존 Layout 방식에서 나아간 새로운 방식임
- Layout이라는 큰 틀이 있고, 내부에 Section과 Group으로 묶인 Item이 있는 형태임

```
// 구현 코드 예시
let size = NSCollectionLayoutSize(widthDimension: .fractionWidth(1.0), heightDimension: .absolute(44.0))

let item = NSCollectionLayoutItem(layoutSize: size)
let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
let section = NSCollectionLayoutSection(group: group)
let layout = UICollectionViewCompositionalLayout(section: section)
```

## 참고
- https://developer.apple.com/videos/play/wwdc2019/220/ (Advance DataSource)
- https://developer.apple.com/videos/play/wwdc2019/215/ (Advances in Collection View Layout)

