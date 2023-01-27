# bootpay

[Flutter Bootpay 개발 문서](https://docs.bootpay.co.kr/?front=flutter&backend=curl#step-production) 사이트를 참조하였습니다.
```
Bootpay API를 사용하여 인앱 결제를 구현해보았습니다.

먼저 Frontend 클라이언트 단 결제 연동을 개발한 후에 
Backend 서버 단의 결제 결과 수신 및 취소 연동을 개발하고
테스트 개발 연동까지를 목표로 하고 개발을 하였습니다.
```

## 필요한 패키지 추가
```
bootpay 모듈과 생체 인증 결제 사용시 필요한 bootpay_bio 모듈을 설치하였습니다.
서버에서 데이터를 받아오기 위한 get 모듈을 추가 설치하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/214777425-d2dc7120-669e-4e63-9c88-29b48f6dc5b7.png)

## PG일반 카드 결제 테스트 ( 결제 요청1 )
```
PG사의 결제창을 통해 결제를 요청합니다. 
별도의 서버 개발 없이도 결제창을 띄워 실제 결제 진행까지 이 섹션을 통해 가능합니다.
```
![image](https://user-images.githubusercontent.com/58906858/214784045-c8f93fa6-d1f0-4198-9460-d9565e9c26c5.png)

```
기본 화면에 다양한 결제 방식의 버튼을 추가하면서 테스트해보았습니다.

제일 먼저 PG 일반 카드 결제 테스트의 예제코드를 사용해보았습니다.
```
![image](https://user-images.githubusercontent.com/58906858/214783943-f65cd243-7d55-4d6f-9519-c53c9514c222.png)

```
PG 일반 결제 버튼을 누르면 payload로 선택 상품의 이름과 가격 등의 정보를 각각의 payload 키의 값으로 전달해주었습니다.
결제 요청같은 경우 bootpay 안에 payload 모듈안에 결제 방식, 상품, 가격 등의 정보가 들어가 있는 것 같았습니다.

```
![image](https://user-images.githubusercontent.com/58906858/214784355-6094d04e-350b-438b-b2d1-dd3f6298128c.png)

![image](https://user-images.githubusercontent.com/58906858/214784188-6daad539-2924-4955-b117-de8733305064.png)

## PG일반 카드 결제 테스트 ( 결제 요청2 )
```
약관을 모두 동의한 후에는 결제 방식의 최종 확인과 구매자의 이메일을 입력할 수 있는 창이 나옵니다.
결제자의 정보를 user에 담은 뒤에 payload 키의 값으로 전달해주었습니다.
```
![image](https://user-images.githubusercontent.com/58906858/214785259-7480bb6d-097c-4d97-9e64-ffc51965279c.png)

![image](https://user-images.githubusercontent.com/58906858/214785316-29a176a3-608a-4ae6-be9e-862f1dc4176a.png)

## PG일반 카드 결제 테스트 ( 다른 결제사로 요청 )
```
카드를 선택한 후에 결제하는 다른 방식 extra로 일반 결제, sms 결제, 페이코앱, 삼성페이앱 등으로
결제를 시도할 수 있게 할 수 있습니다. 역시 extra에 결제 방식을 담아서 payload 값으로 전달해주었습니다.
```
![image](https://user-images.githubusercontent.com/58906858/214785778-b94bcede-6e54-4cec-9bc1-efae8b7c1534.png)

![image](https://user-images.githubusercontent.com/58906858/214786055-34afb4ae-3c14-4fd3-aebd-5e60ba7ac33b.png)
![image](https://user-images.githubusercontent.com/58906858/214786080-0a233cdb-db89-4ba0-badd-a392181d8848.png)

## 통합 결제
```
통합결제창은 부트페이 관리자에서 활성화된 결제수단이 모두 노출되는 결제창으로,
통합결제 연동시 소스코드 수정없이 PG사를 변경할 수 있다는 장점이 있습니다. 
개발이슈를 줄이고자 한다면 통합결제 사용을 추천하고 있습니다.

메인화면에 통합 결제 창으로 이동하는 버튼을 추가해주었습니다.
```
![image](https://user-images.githubusercontent.com/58906858/215045756-09cee923-518c-4de6-91c4-362c38fdfdf9.png)

## 통합 결제 테스트 코드
```
통합 결제 테스트 코드(total_payment.dart)를 사용해보았습니다.
일반 결제(신용 카드, 휴대결제, 계좌 이체, 가상계좌) 기능을 제공하고 
간편 결제(카카오페이, 네이버페이, 페이코)를 제공하는 것을 알 수 있었습니다.
```
![image](https://user-images.githubusercontent.com/58906858/215046275-8b6cfd87-0f73-4c08-816e-00f094f11258.png)

## 카드 자동 결제 (인증)
```
payletter 본인 인증을 거친 후에 정기적으로 자동으로 카드에서 돈이 빠져나가는 기능을 지원합니다.

메인 화면에 카드 자동 결제(인증) 창으로 이동하는 버튼을 추가하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/215048071-d4df86b6-7cb0-491a-adb5-816a08eb1d0b.png)

## 카드 자동 결제 (인증) 테스트 코드
```
카드 번호, 유효 기간, 생년 월일, 비밀 번 등 본인 확인을 거친 후에 자동으로 카드에서 결제되는 서비스입니다.
```
![image](https://user-images.githubusercontent.com/58906858/215049177-d1154cf5-341b-48f6-be1c-f70e4faf5619.png)

## 카드 자동 결제 (비인증) 테스트 코드
```
카드자동 결제 (인증) 과 다르게 비인증은 소유하고 있는 카드를 등록한 후에 
자동으로 카드에서 결제되는 서비스입니다.
```
![image](https://user-images.githubusercontent.com/58906858/215050563-0bb4fb8c-543d-4bf1-bcd5-c196e1e3612d.png)

## 본인 인증 결제 테스트 코드
```
payload 키의 method 방법으로 본인인증을 주어서 PASS에서 휴대폰으로 본인 인증을 시도합니다.
```
![image](https://user-images.githubusercontent.com/58906858/215051325-96fa7679-267f-4891-a5b8-99bc76e1c8af.png)
![image](https://user-images.githubusercontent.com/58906858/215051762-dbc56600-1938-417e-8a98-c6cdec7b771d.png)

