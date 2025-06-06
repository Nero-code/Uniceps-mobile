const exercisesJson = r"""
[
  {
    "Tid": 1,
    "Name": "ضغط عالي بالبار",
    "ImageId": 1,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "ضغط دامبلز",
    "ImageId": 2,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "ضغط مستوي بالبار",
    "ImageId": 3,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "فتح دامبلز",
    "ImageId": 4,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "ضغط اسفل بالبار",
    "ImageId": 5,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "ضغط عالي على الهمر",
    "ImageId": 6,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "ضغط جالسا على الالة ",
    "ImageId": 7,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "تجميع بالالة",
    "ImageId": 8,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 9,
    "Name": "تجميع بالكابل ",
    "ImageId": 9,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 10,
    "Name": "بول اوفر",
    "ImageId": 10,
    "GroupId": 1,
    "Id": 0
  },
  {
    "Tid": 11,
    "Name": "متوازي",
    "ImageId": 11,
    "GroupId": 1,
    "Id": 0
  },

  {
    "Tid": 1,
    "Name": "ضغط بار امام الراس جالسا",
    "ImageId": 1,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "تبادل امامي دامبلز",
    "ImageId": 2,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "ضغط دامبلز جالسا",
    "ImageId": 3,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "رفرفه جانبية بالدامبلز ",
    "ImageId": 4,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "كتف خلفي فراشة",
    "ImageId": 5,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "رفع جانبي بالكابل ",
    "ImageId": 6,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "رفرفة جانبي منحني",
    "ImageId": 7,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "رفع جانبي بالدامبلز مستلقيا",
    "ImageId": 8,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 9,
    "Name": "نشل بالبار تحت الذقن ",
    "ImageId": 9,
    "GroupId": 2,
    "Id": 0
  },
  {
    "Tid": 10,
    "Name": "هز الاكتاف ",
    "ImageId": 10,
    "GroupId": 2,
    "Id": 0
  },

  {
    "Tid": 1,
    "Name": "السحب على الثابت",
    "ImageId": 1,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "السحب بالبكرة ",
    "ImageId": 2,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "السحب على الالة للاسفل",
    "ImageId": 3,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "التجديف جالسا ",
    "ImageId": 4,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "السحب العلوي بالقبضات المتقابلة",
    "ImageId": 5,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "التجديف بالدامبلز",
    "ImageId": 6,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "T - BAR",
    "ImageId": 7,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "تجديف منحني بالبار ",
    "ImageId": 8,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 9,
    "Name": "سحب علوي لاتس",
    "ImageId": 9,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 10,
    "Name": "سحب دامبل مائل",
    "ImageId": 10,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 11,
    "Name": "رفع الجذع على الكرسي الروماني",
    "ImageId": 11,
    "GroupId": 3,
    "Id": 0
  },
  {
    "Tid": 12,
    "Name": "الرفعة الميتة",
    "ImageId": 12,
    "GroupId": 3,
    "Id": 0
  },

  {
    "Tid": 1,
    "Name": "طاولة امامي",
    "ImageId": 1,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "سكوات",
    "ImageId": 2,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "هاك سكوات",
    "ImageId": 3,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "الاندفاع للامام",
    "ImageId": 4,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "ثني الارجل مستلقيا",
    "ImageId": 5,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "قرفصاء بالدامبل",
    "ImageId": 6,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "مكبس",
    "ImageId": 7,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "ضم \/ فتح الارجل",
    "ImageId": 8,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 9,
    "Name": "رفع ورك بالبار",
    "ImageId": 9,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 10,
    "Name": "ركل ورك",
    "ImageId": 10,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 11,
    "Name": "سيسي سكوات",
    "ImageId": 11,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 12,
    "Name": "الرفعة الميتة",
    "ImageId": 12,
    "GroupId": 4,
    "Id": 0
  },
  {
    "Tid": 1,
    "Name": "واقفا بالبار",
    "ImageId": 1,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "تبادل بالدامبلز",
    "ImageId": 2,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "ثني اليدين بالبكرة",
    "ImageId": 3,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "تركيز بالدامبلز",
    "ImageId": 4,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "تركيز على الالة",
    "ImageId": 5,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "بطل العالم",
    "ImageId": 6,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "مطارق",
    "ImageId": 7,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "هز سواعد بالبار ",
    "ImageId": 8,
    "GroupId": 5,
    "Id": 0
  },
  {
    "Tid": 1,
    "Name": "ثني اليدين بالبار مستلقيا ",
    "ImageId": 1,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "الدفع للاسفل بالبكرة ",
    "ImageId": 2,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "تركيز بالدامبل مستلقيا",
    "ImageId": 3,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "ثني اليدين جالسا بالبار",
    "ImageId": 4,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "تركيز دامبل خلف الراس",
    "ImageId": 5,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "رفس دامبل",
    "ImageId": 6,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "دفع خلف الراس بالبكرة",
    "ImageId": 7,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "الغطس بين مقعدين",
    "ImageId": 8,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 9,
    "Name": "متوازي",
    "ImageId": 9,
    "GroupId": 6,
    "Id": 0
  },
  {
    "Tid": 1,
    "Name": "جالسا",
    "ImageId": 1,
    "GroupId": 7,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "واقفا ",
    "ImageId": 2,
    "GroupId": 7,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "مكبس",
    "ImageId": 3,
    "GroupId": 7,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "هاك سكواد",
    "ImageId": 4,
    "GroupId": 7,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "واقفا بالدامبل",
    "ImageId": 5,
    "GroupId": 7,
    "Id": 0
  },
  {
    "Tid": 1,
    "Name": "رفع الجذع مستلقيا",
    "ImageId": 1,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 2,
    "Name": "مد و جزر",
    "ImageId": 2,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 3,
    "Name": "طحن على الكرسي",
    "ImageId": 3,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 4,
    "Name": "رفع الارجل على المتوازي",
    "ImageId": 4,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 5,
    "Name": "طحن بالكابل",
    "ImageId": 5,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 6,
    "Name": "رفع الارجل مستلقيا",
    "ImageId": 6,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 7,
    "Name": "طحن بالهمر",
    "ImageId": 7,
    "GroupId": 8,
    "Id": 0
  },
  {
    "Tid": 8,
    "Name": "دوران الجذع  ",
    "ImageId": 8,
    "GroupId": 8,
    "Id": 0
  }
]
""";
