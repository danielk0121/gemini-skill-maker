rm -rf session-handover.skill
zip -r session-handover.skill session-handover
echo "session-handover.skill 파일 생성 완료"

echo "session-handover.skill 설치 시작"
gemini skills install session-handover.skill
