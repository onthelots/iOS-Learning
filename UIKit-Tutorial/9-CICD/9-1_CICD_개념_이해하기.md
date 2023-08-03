# CI/CD 개념 이해하기
`앱이 만들어지고 나서, 사용자에게 전달될 때까지의 과정`
> 지속적인 통합, 지속적인 서비스 제공, 지속적인 배포

![cicd](https://github.com/onthelots/Spotify_App/assets/107039500/6b8d410d-4183-4481-b606-835d91c10594)
(출처 : GitLab)

```
1. 코드를 작성
2. Commit을 실시
3. 빌드와 Unit Test를 실시
4. 리뷰 및 릴리즈
```

## CI (Continuous integration)
- 지속적인 통합(ingegration)
  - 기존에 만들어진 프로젝트 골자 위에 업데이트, 수정, 리팩토링 코드를 병합(Merge)하는 작업
  - 병합(Merge) 이후, 앱이 올바르게 동작하는지 빌드 및 테스트를 수행함
  (문제가 생길 경우, 배포를 할 수 없음)

<br>

## CD (Continuous Delivery, Deployment)
- 지속적인 제공(Delivery)
  - CI과정이 성공적으로 진행된 이후, 빌드와 테스트를거쳐 Github, GitLab과 같은 저장소에 업로드하는 것
- 지속적인 배포(Deployment)
  - 성공적으로 병합된 사항을 '배포환경(사용자가 사용할 수 있는 환경)'까지 릴리즈 하는 것 

<br>

## 왜 CI/CD는 필요한가?
- 개발 시간이 촉박할 경우, 수동적(Manuel)적으로 위 과정을 진행하게 됨 (Continuous Deployment까지 주기가 짧음)
- CI/CD PIPELINE은 자동적으로 통합, 제공, 배포를 실시하는 프로세스가 구축된 형태임

## CI/CD를 위한 과정
- <Fastlane>과 <GitHub Action>을 이용하여 배포 파이프라인 자동화를 구축할 수 있음
