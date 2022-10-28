def edit_distance(string1, string2):

    if len(string1) > len(string2):
        difference = len(string1) - len(string2)
        string1[:difference]

    elif len(string2) > len(string1):
        difference = len(string2) - len(string1)
        string2[:difference]

    else:
        difference = 0

    for i in range(len(string1)):
        if string1[i] != string2[i]:
            difference += 1

    return difference



def jaccard_similarity(list1, list2):
    intersection = len(set(list1).intersection(list2)) #no need to call list here
    union = len(list1 + list2) - intersection #you only need to call len once here
    return intersection / union #also no need to cast to float as this will be done for you



if __name__ == "__main__":
    s1 = "Peter Rob, Carlos Coronel"
    s2 = "Carlos Coronel;Steven Morris;Peter Rob;"
    edit_value = edit_distance(s1, s2)
    print(edit_value)
    # 39
    list1 = s1.split(' ')
    list2 = s2.replace(';', ' ').split(' ')
    print(list1, '#'*5, list2)
    j_value = jaccard_similarity(list1, list2)
    print(j_value)