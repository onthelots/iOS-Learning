# Attributes (속성)

## 수식과 함께 예시로 살펴보는 Constraint
- 여기서 Layout을 잡아주고자 하는 뷰는 'RedView'임
- 단순하게 수식 살펴보자면..
    - RedView는 BlueView의 오른쪽(trailing) 방향에서부터 8 point가 떨어저야 한다는 것을 직관적으로 이해할 수 있음
    - 그렇다면, 각각의 Attributes(속성)은 어떤 의미를 가지고 있을지 이해할 필요가 있음
    
    // 그림


## AutoLayout의 Attributes
- 다양한 Attributes가 존재함
- 왜 Leading과 Trailing이라고 하는데?
    - 이는, '글이 시작하는 방향'에 따른 사항임
    - 미국에서는 왼쪽에서 오른쪽으로 글을 읽고 있음(왼쪽이 '선행'하며, 오른쪽이 '후행'하는 것으로 인식함)
    - 따라서, 여기서도 왼쪽의 명칭을 Left가 아닌 'Leading'으로 사용함, 오른쪽은 자연스레 'Trailing'으로 사용함
    - ⁉️ 만약, Apple이 중동지역에 위치한 나라의 회사였다면? : 왼쪽을 'Trailing'으로 사용했을 것임
    
    // 그림

- Baseline이란?
    - '글자'의 맨 아랫, 끝나는 지점 (HIG에서 자세하게 살펴볼 수 있음)
