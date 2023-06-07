# StackView Elements
`제약 조건의 복잡성을 해소하는 AutoLayout`
> StackView를 활용, 내부 요소의 [정렬] 방식에 따라 복잡하지 않은 제약을 통해 Layout을 구성할 수 있음 

## Elements

### axis : Horizontal(수평), Vertical(수직)

---

### distribution : 요소들의 사이즈를 어떻게 분배할 것인지? 
`UIStackView.Distribution.fill`
> Hugging Priority에 따라 달라짐

<br>

![Frame 9](https://github.com/onthelots/iOS-Learning/assets/107039500/68dd9cbd-452b-4dd9-b138-e75f72aeaada)

<br>

`UIStackView.Distribution.fillEqually`
> 동일한 Size(axis에 따라 너비 혹은 높이)로 조정

<br>

![Frame 10](https://github.com/onthelots/iOS-Learning/assets/107039500/ba874e5b-caab-4f59-8954-26ab26126bbf)

<br>

`UIStackView.Distribution.fillProportionally`
> 콘텐츠의 비율에 따라 조정

<br>

![Frame 11](https://github.com/onthelots/iOS-Learning/assets/107039500/0318f614-3027-44cd-a04a-9813dafa2960)

<br>

`UIStackView.Distribution.equalSpacing`
> [fillEqually]와 유사하나, 동일한 간격(Spacing)에 따라 조정

<br>

![Frame 12](https://github.com/onthelots/iOS-Learning/assets/107039500/87072651-5861-4ff9-af7f-177515950efc)

<br>

`UIStackView.Distribution.equalCentering`
> 각 콘텐츠의 [Center] 위치를 기준으로, 동일한 간격(equalSpacing)으로 조정

<br>

![Frame 13](https://github.com/onthelots/iOS-Learning/assets/107039500/f33e5b56-bbaa-475e-9a68-33cde474e8a2)

<br>

--- 

### Alignment : 요소들의 위치 및 정렬방향을 어떻게 결정할 것인지?
`UIStackView.Aligment.fill`
> Axis의 [반대방향]으로 콘텐츠가 꽉 들어차게 됨

<br>

![Frame 14](https://github.com/onthelots/iOS-Learning/assets/107039500/332523af-2b99-48e1-b6e2-c546d923713b)

<br>

`UIStackView.Aligment.(leading,trailing, top, bottom)`
> 각 콘텐츠들의 고유 사이즈는 그대로, 정렬 방향을 결정함

<br>

![Frame 15](https://github.com/onthelots/iOS-Learning/assets/107039500/df436494-007a-4f78-974d-d6c0050f86c0)

<br>

`UIStackView.Aligment.firstBaseline`
> 콘텐츠에 [Text]가 존재할 경우, 가장 상단에 위치한 Text의 Baseline을 모두 정렬함

<br>

![Frame 16](https://github.com/onthelots/iOS-Learning/assets/107039500/9b3479ec-9c84-4fa4-babc-d31df427bf16)

<br>

`UIStackView.Aligment.lastBaseline`
> 콘텐츠에 [Text]가 존재할 경우, 가장 하단에 위치한 Text의 Baseline을 모두 정렬함

<br>

![Frame 17](https://github.com/onthelots/iOS-Learning/assets/107039500/efe8c0c1-7543-4d9a-a619-43476bee4373)
