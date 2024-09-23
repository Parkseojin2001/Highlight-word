from django.db import models

# Create your models here.
class HighlightedWord(models.Model):
    word = models.CharField(max_length=100)     # 모르는 단어
    meaning = models.TextField()    # 단어의 뜻
    sentence = models.TextField()   # 단어가 사용된 문장
    
    def to_list(self):
        return [self.word, self.meaning, self.sentence]