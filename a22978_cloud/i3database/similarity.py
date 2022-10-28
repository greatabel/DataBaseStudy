'''
Created on 1 May 2020

@author: shree
'''


def calc_jaccard(str1, str2, q):
    str1_tokens = tokenize(str1, q)
    str2_tokens = tokenize(str2, q)
    total_tokens = str1_tokens + str2_tokens
    total_tokens = list(set(total_tokens))
    return (len(str1_tokens) + len(str2_tokens) - len(total_tokens)) / len(total_tokens)


def tokenize(string, q):
    if q != 0:
        if len(string) < q:
            str_tokens = [string]
        else:
            str_tokens = [string[i:i + q] for i in range(0, len(string) - q + 1, 1)]
        return list(set(str_tokens))
    else:
        str_tokens = string.split(" ")
        return list(set(str_tokens))


def calc_ed_sim(str1, str2):
    if str1 == str2:
        return 1
    ed = calc_ed(str1, str2)

    return 1 - (ed / max(len(str1), len(str2)))


def calc_ed(str1, str2):
    ed = 0

    '''
         * Please implement the calculation of edit distance between two strings
         * Dynamic programming should be used
         */
    '''
    return ed


#Un-comment following block of code to check the Edit distance and Jaccard similarity.

# 
# str1 = "University"
# str2 = "Unvesty"
# out = calc_ed(str1, str2)
# print("Edit Distance = ", out)
# out2 = calc_jaccard(str1, str2, 2)
# print("Jaccard Coefficient = ", out2)

