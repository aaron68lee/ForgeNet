#import editdistance

# compute edit distance between two strings (missing import)
def levenshtein_distance(s1, s2):
    len_s1, len_s2 = len(s1), len(s2)
    dp = [[0] * (len_s2 + 1) for _ in range(len_s1 + 1)]

    for i in range(len_s1 + 1):
        for j in range(len_s2 + 1):
            if i == 0:
                dp[i][j] = j
            elif j == 0:
                dp[i][j] = i
            elif s1[i - 1] == s2[j - 1]:
                dp[i][j] = dp[i - 1][j - 1]
            else:
                dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])

    return dp[len_s1][len_s2]

def cer(r, h, casesensitive=True):
    if not casesensitive:
        r=r.lower()
        h=h.lower()
    #Remove any double or trailing
    r = u' '.join(r.split())
    h = u' '.join(h.split())

    return err(r, h)

def err(r, h):
    dis = levenshtein_distance(r, h) #editdistance.eval(r, h)
    if len(r) == 0.0:
        return len(h)

    return float(dis) / float(len(r))

def wer(r, h,  casesensitive=True):
    if not casesensitive:
        r=r.lower()
        h=h.lower()
    r = r.split()
    h = h.split()

    return err(r,h)
