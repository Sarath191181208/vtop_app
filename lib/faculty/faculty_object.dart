import 'dart:collection';

var data = [
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/06/70303-Sudha-S-V.jpg",
    "name": "Dr.Sudha S VDean",
    "specialization":
        "Specialization Areas: Soft Computing, Optimization Techniques, Artificial Intelligence, Machine Learning, Data Structures and Algorithms"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-SAROJ-KUMAR-PANIGRAHY.jpg",
    "name": "Dr. Saroj Kumar PanigrahyAssociate-Dean",
    "specialization":
        "Specialization Areas: Wireless Body Area Networks, Wireless Sensor Networks, IoT, Cryptography"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-HARI-SEETHA.jpg",
    "name": "Dr. Hari Seetha",
    "specialization":
        "Specialization Areas:Large Data Classification, Data Mining, Data Analytics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-PRADEEP-REDDY.jpg",
    "name": "Dr. CH. Pradeep Reddy",
    "specialization":
        "Specialization Areas:Wireless Networks, Cloud Computing, IOT, Open Source Technologies"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-B.-SOUBHAGYA-SANKAR.jpg",
    "name": "Dr. Soubhagya Sankar Barpanda",
    "specialization":
        "Specialization Areas:Biometrics, Hyperspectral Image Analysis, Software Engineering"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-B.-SRINIVAS.jpg",
    "name": "Dr. B. Srinivasa Rao",
    "specialization":
        "Specialization Areas:Soft Computing, Image Processing, Machine Learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-E.-AJITH-JUBILSON.jpg",
    "name": "Dr. E. Ajith Jubilson",
    "specialization":
        "Specialization Areas: Software Agents, Artificial Intelligence, Machine Learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-HUSSAIN-SYED.jpg",
    "name": "Dr. Hussain Syed",
    "specialization":
        "Specialization Areas: Human computer interaction, Software Engineering, Data Analytics, Business intelligence"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Ms.-DEEPASIKHA-MISHRA.jpg",
    "name": "Dr. Deepasikha Mishra",
    "specialization":
        "Specialization Areas: Image Processing, Pattern Recognition, Knowledge Engineering, Signal Processing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Mr.-S.-KARTHIKEYAN.jpg",
    "name": "Dr.S.Karthikeyan",
    "specialization":
        "Specialization Areas: Bigdata Analytics, Artificial Intelligence & Distributed Machine Learning(Deep Neural Network Optimization), Computer Vision"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-RAVI-SANKAR-SANGAM.jpg",
    "name": "Dr. Ravi Sankar Sangam",
    "specialization":
        "Specialization Areas: Data Clustering & Mining, Operating Systems, Data Base Management Systems"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-B.-RAVI-SANKAR-BARPANDA.jpg",
    "name": "Dr. Ravi Shankar Barpanda",
    "specialization":
        "Specialization Areas: Optical Networks, Communication Networks, Evolutionary Computing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-ASHISH-KUMAR-DALAI.jpg",
    "name": "Mr. Asish Kumar Dalai",
    "specialization":
        "Specialization Areas: Network Security, Device Authentication & Intrusion Detection, Web Application Security"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-ANUPAMA-NAMBURU.jpg",
    "name": "Dr. Anupama Namburu",
    "specialization":
        "Specialization Areas: Digital image processing, Big data analytics, Soft Computing, Machine Learning, Data Science"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-HARI-KISHAN-KONDAVEETI.jpg",
    "name": "Dr. K. Hari Kishan",
    "specialization":
        "Specialization Areas: Digital Image Processing, Internet of Things, Remote Sensing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Nandha_70079.jpg",
    "name": "Dr. R. Nandha Kumar",
    "specialization":
        "Specialization Areas: Wired & Wireless Networks, Machine Learning, IoT, Computer Networks"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-S.-SIBI-CHAKRAVARTY.jpg",
    "name": "Dr. Sibi Chakkaravarthy S",
    "specialization":
        "Specialization Areas: Cyber attacks and detection, Drone Security, Consumer Electronics Security"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SUDHAKAR-ILANGO-1.jpg",
    "name": "Dr. Sudhakar Ilango",
    "specialization":
        "Specialization Areas: Image Processing, soft computing, automata theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/vijya-copy.jpg",
    "name": "Dr. J. Vijaya",
    "specialization":
        "Specialization Areas: Artificial Intelligence, Data Science and Big data, Machine Learning and Data mining"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/bksp-kumar.jpg",
    "name": "Dr. Bksp Kumar Raju Alluri",
    "specialization":
        "Specialization Areas: Digital Forensics, Cloud Computing, Cloud Forensics, Data Mining"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/aravaplli.jpg",
    "name": "Dr. Aravapalli Rama Satish",
    "specialization":
        "Specialization Areas: Data Mining, Machine Learning, Big Data, Computer Networks"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/devarkonda-copy.jpg",
    "name": "Dr. Nagaraju Devarakonda",
    "specialization":
        "Specialization Areas:Data Mining, Machine Learning, Soft Computing, Optimization Techniques"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/gopi-krishnan-1.jpg",
    "name": "Dr. S. Gopikrishnan",
    "specialization":
        "Specialization Areas: Wireless Sensor networks, Internet of Things, Cyber Physical Systems, Network Security"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/hari1.jpg",
    "name": "Dr. Harikiran Jonnadula",
    "specialization":
        "Specialization Areas: Image and Video Processing, Microarray Images, Hyperspectral Imaging, Machine learning"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/sumathi.jpg",
    "name": "Dr. D Sumathi",
    "specialization":
        "Specialization Areas: Data Structures, Cloud Computing, Artificial Intelligence, Machine Learning and NLP"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/prabha.jpg",
    "name": "Dr. Prabha Selvaraj",
    "specialization":
        "Specialization Areas: Data mining, Information Retrieval, Cryptography & Network Security, Wireless Communications, Machine Learning, IoT, Block Chain"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/nitesh.jpg",
    "name": "Dr. Nitesh A. Funde",
    "specialization":
        "Specialization Areas: Data Analytics, Smart grid, Optimization Techniques, Data Science and Soft Computing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/sandipan.jpg",
    "name": "Dr. Sandipan Maiti",
    "specialization":
        "Specialization Areas: DBMS, Data Warehousing, Data Mining, Pattern Recognition, Big-data Analytics, Modeling of DSS and KDD, Software Engineering."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/sunil.jpg",
    "name": "Dr. Sunil Kumar Singh",
    "specialization":
        "Specialization Areas: Wireless Sensor Networks, IoT, MANET, Drone Networks, Software Define Networks"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/09/abjit.jpg",
    "name": "Dr. Abhijit Adhikari",
    "specialization":
        "Specialization Areas: Semantic Measures, NLP, Swarm Intelligence, Deep Learning, Database Management System, Data Structures and Algorithms, Operating System, Theory of Computation, Graph Theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/ganesh-reddy-1.jpg",
    "name": "Dr. Ganesh Reddy Karri",
    "specialization":
        "Specialization Areas: Computer and Network Security, Cloud computing, Wireless networks, Data structures and Algorithms"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/sanjit_70147.jpg",
    "name": "Dr. Sanjit Ningthoujam",
    "specialization":
        "Specialization Areas: Wireless Networks (Packet Combining Techniques),MANET, Molecular Communications, IoBNT, Graph Theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/debasis_70151.jpg",
    "name": "Dr. Kumar Debasis",
    "specialization":
        "Specialization Areas: Wireless Sensor Networks, Internet of Things, Wireless Networks Intrusion Detection, Network Security"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/awnish_70158.jpg",
    "name": "Dr. Awnish Kumar",
    "specialization":
        "Specialization Areas: Machine learning, Computer networks, Artificial Intelligence, Image processing, Digital electronics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/ranjan_70167.jpg",
    "name": "Dr. Somya Ranjan Sahoo",
    "specialization":
        "Specialization Areas: Cybersecurity, Big data security, IoT security, Social network security, Intrusion detection system"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/M-Priyadharshini_70177.jpg",
    "name": "Dr. M Priyadharshini",
    "specialization":
        "Specialization Areas: Data Base Management Systems, Data Science, Enterprise and Web Technologies, Software Engineering, Object Oriented System Development"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Mangalraj_70190.jpg",
    "name": "Dr. Mangalraj",
    "specialization":
        "Specialization Areas: Computer vision and image processing, Remote sensing, Machine learning, Data analytics, Artificial intelligence"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/Vikash-Kumar_70202.jpg",
    "name": "Dr. Vikash Kumar Singh",
    "specialization":
        "Specialization Areas: Algorithmic Game Theory and its Applications, Crowdsourcing, Reinforcement Learning, Design and Analysis of Algorithms"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Anjali_70205.jpg",
    "name": "Dr. Anjali Gautam",
    "specialization":
        "Specialization Areas: Time series data mining, Machine learning, Deep learning, Time series analysis, Signal processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/anil-carie-min.jpg",
    "name": "Dr. Chettupally Anil Carie",
    "specialization":
        "Specialization Areas: Cognitive Radio Networks, Wireless Sensor Networks, IoT, Game Theory, Machine learning"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/09/Sanket-Mishra.jpg",
    "name": "Mr. Sanket Mishra",
    "specialization":
        "Specialization Areas: IoT Analytics, Stream Processing, Event detection from Social data, Anomaly detection, Machine learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/09/Rathinaraja-Jeyaraj.jpg",
    "name": "Dr. Rathinaraja Jeyaraj",
    "specialization":
        "Specialization Areas: Big Data Processing and Analytics, Cloud Computing, Applied Machine Learning, Optimization Techniques"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Nileshchandra-Kalbarao-Pikle.jpg",
    "name": "Dr. Nileshchandra Kalbarao Pikle",
    "specialization":
        "Specialization Areas:Parallel Computing, Data Science, High Performace Computing, Image Processing, Scientific Computing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Mudigonda-Krishna-Siva-Prasad.jpg",
    "name": "Dr. Mudigonda Krishna Siva Prasad",
    "specialization":
        "Specialization Areas:Natural Language Processing, Computational Linguistics, Artificial Intelligence, Text Mining, Machine Learning"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/img1.jpg",
    "name": "Dr. Chandan Bandyopadhyay",
    "specialization":
        "Specialization Areas:Reversible Logic Synthesis, Quantum Circuit Design, Optical Circuit Implementation using MZI, Logic synthesis and Optimization using Graph IRs, DNA Computing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Mehfooza-Munavar-Basha.jpg",
    "name": "Dr. Mehfooza Munavar Basha",
    "specialization":
        "Specialization Areas:Software Engineering, Data Analytics, Machine Learning, Artificial Intelligence, Soft Computing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Senthil-Murugan.jpg",
    "name": "Dr. Senthil Murugan",
    "specialization":
        "Specialization Areas:Artificial Intelligence, Internet of Things, Big Data Analytics, Natural Language Processing, Data Mining"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Lalitha-Kumari-Pappala.jpg",
    "name": "Dr. Lalitha Kumari Pappala",
    "specialization":
        "Specialization Areas: Data mining, Pattern mining, Machine learning, Artificial Intelligence, Data Science and Big data"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Chitipireddi-Koteswararao.jpg",
    "name": "Dr. Chittipireddi Koteswararao",
    "specialization":
        "Specialization Areas: Cryptography, Secure Multiparty Computation, Secure Algorithms, Graph Theory, Data Structures"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Karthika-Natarajan.jpg",
    "name": "Dr. Karthika Natarajan",
    "specialization":
        "Specialization Areas: Information Retrieval,,Big data, Data Science, Machine Learning, Deep learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Sheela-jayachandran.jpg",
    "name": "Dr. Sheela Jayachandran",
    "specialization":
        "Specialization Areas: Information Retrieval, Natural Language processing, Information Extraction, Machine Learning, Deep learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Udit-Narayana-Kar.jpg",
    "name": "Dr. Udit Narayana Kar",
    "specialization":
        "Specialization Areas: Wireless Networks, Device-to-Device Communications, Topology Transparency Scheduling, 5G Cellular communications and BeyondInternet of Things (IoT)"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Kuppusamy.jpg",
    "name": "Dr. P. Kuppusamy",
    "specialization":
        "Specialization Areas: Artificial Intelligence, Machine Learning  and Deep Learning, Data Science, Internet of Things, Image Processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Arundhati-Das.jpg",
    "name": "Ms. Arundhati Das",
    "specialization":
        "Specialization Areas:  Image processing, Machine learning, Deep learning, Remote sensing image analysis and Mathematical morphology"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Sushil-Kumar-Tiwari.jpg",
    "name": "Dr. Sushil Kumar Tiwari",
    "specialization":
        "Specialization Areas: Wireless Network, Indoor localization, VANET, WSN, Machine learning, Internet of things"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Divya-Meena-Sundaram.jpg",
    "name": "Dr. Divya Meena Sundaram",
    "specialization":
        "Specialization Areas: Machine Learning, Data Analytics, Artificial Intelligence, Remote Sensing, Computer Vision and Image processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Rohit-Kumar-Das.jpg",
    "name": "Dr. Rohit Kumar Das",
    "specialization":
        "Specialization Areas: Computer Networks, Internet of Things, Software-Defined Network, Blockchain and Big Data"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Monali-Bordoloi.jpg",
    "name": "Dr. Monali Bordoloi",
    "specialization":
        "Specialization Areas: Sentiment Analysis, NLP, Machine Learning, Artificial Intelligence, Data Mining ​"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Nikhil-Mhala.jpg",
    "name": "Dr. Nikhil Mhala",
    "specialization":
        "Specialization Areas: Image Security, Image Processing, Medical Imaging, Information Security, Operating System ​"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Manomita-Chakraborty.jpg",
    "name": "Dr. Manomita Chakraborty",
    "specialization":
        "Specialization Areas: Machine Learning, Data Mining, Pattern Recognition, Neural Networks, Deepm Learning ​"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Snehal-Bankatrao-Shinde.jpg",
    "name": "Dr. Snehal Bankatrao Shinde",
    "specialization":
        "Specialization Areas: Theory of Computation, Modeling and Simulation, Systems biology, Machine Learning, Database"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/06/D-SUJATHA.jpg",
    "name": "Dr. Dandu Sujatha",
    "specialization":
        "Specialization Areas: Data Mining, Artificial Intelligence, Machine Learning, Big Data Analytics, Database Management systems"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/06/Subrata-Tikadar.jpg",
    "name": "Dr. Subrata Tikadar",
    "specialization":
        "Specialization Areas: Human-Computer Interaction, Affective Computing, Learning Technology, User-Centric Computing, Ubiquitous Computing ​"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/70302-Debarati-Bhunia-Chakraborty.jpg",
    "name": "Dr.Debarati Bhunia Chakraborty",
    "specialization":
        "Specialization Areas: Video processing, soft computing, deep learning, approximate reasoning artificial intelligence ​​"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dr.Reeja_.jpg",
    "name": "Dr.Reeja S R",
    "specialization":
        "Specialization Areas: High Performance Computing, Machine Learning, Artificial Intelligence, Computer Vision, Data Analytics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/70307-Muneeswari.jpg",
    "name": "Dr. G.Muneeswari",
    "specialization":
        "Specialization Areas: Parallel Algorithms for Multicore Architectures, Network Security, Distributed Computing, Machine Learning, Networking"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/70308-Dr-D-Venkata-Lakshmi.jpg",
    "name": "Dr. Dasari Venkata Lakshmi",
    "specialization":
        "Specialization Areas: Algorithms, Theory of computing, Graph Theory, Celluar Automata, Mathematical Modeling"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/06/70309-Hussain.jpg",
    "name": "Dr.Hussain Ahmed Choudhury",
    "specialization":
        "Specialization Areas: Soft computing, Machine Learning, Video Processing cum image processing, Cloud Commuting and cloud security, Computer Networks (MANET, VANET)"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/70310-Afzal-Hussain-Shahid.jpg",
    "name": "Dr.Afzal Hussain Shahid",
    "specialization":
        "Specialization Areas: Soft Computing, Machine Learning, Artificial Intelligence, Automata Theory, Pattern Recognition"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/08/T.Sudhakar.jpg",
    "name": "Dr.T Sudhakar",
    "specialization":
        "Specialization Areas: Cryptography and Network security, Authentication Protocols, Design and analysis of algorithms, Theory of computation, Compiler Design"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/10/70351-Mr.-Gouranga-Mandal.jpg",
    "name": "Mr. Gouranga Mandal",
    "specialization":
        "Specialization Areas: Digital Image/Video Processing, Intelligent Transportation System, Artificial Intelligence, NLP, Pattern Recognition"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Alongbar-Wary.jpg",
    "name": "Dr. Alongbar Wary",
    "specialization":
        "Specialization Areas: Image and Video Processing,Multimedia Information Retrieval,Machine Learning,Deep Learning,Data Analytics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Arun-Kumar-Gopu.jpg",
    "name": "Dr. Arun Kumar  Gopu",
    "specialization":
        "Specialization Areas: Cloud Computing, Distributed Systems, Multi-Objective Optimization,  Bio-Inspired Algorithms, Soft Computing."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Pramod-Kumar.jpg",
    "name": "Dr. Pramod Kumar",
    "specialization":
        "Specialization Areas: Cyber Physical Systems, Software Engineering, Theory of Computation, Compiler Design,  Algorithm Design."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/B-Sai-Chandana.jpg",
    "name": "Dr. Bolem Sai Chandana",
    "specialization":
        "Specialization Areas: Image Processing, Remote Sensing , Hyperspectral image analysis, Machine Learning , Deep learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Basker-Palanisamy.jpg",
    "name": "Mr. Basker Palanisamy",
    "specialization":
        "Specialization Areas: Network security, cryptography, cyber security, cloud computing and VANET security."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Arindam-Dey.jpg",
    "name": "Dr. Arindam Dey",
    "specialization":
        "Specialization Areas: Optimization problem, Genetic Algorithm, Fuzzy set & Fuzzy Logic, Artificial intelligence, Graph theory."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/D-Rajesh-Photo.jpg",
    "name": "Dr. D Rajesh",
    "specialization":
        "Specialization Areas: Geospatial Big data Analytics,Computer Vision and Deep Learning,Remote Sensing and Disaster Management,Agriculture and Drone,Artificial Intelligence and IoT"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Y-Mohamed-Sirajudeen-Photo.jpg",
    "name": "Mr. Y Mohamed Sirajudeen",
    "specialization":
        "Specialization Areas: Cloud Computing,Cyber Security,Cyber Governance,Internet of Things,Artificial Intelligence."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Naseeba-Photo.jpg",
    "name": "Ms. Beebi Naseeba",
    "specialization":
        "Specialization Areas: Artificial Intelligence, Machine Learning, Deep Learning, Computer Networks, Image Processing, DBMS"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Eswaraiah-Rayachoti-Photo.jpg",
    "name": "Dr. Eswaraiah Rayachoti",
    "specialization":
        "Specialization Areas: Image Processing, Design and Analysis of Algorithms, Operating Systems, Theory of Computation, Compiler Design, Deep Learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Mukul-Majhi-Photo.jpg",
    "name": "Ms. Mukul Majhi",
    "specialization":
        "Specialization Areas: Content Based Image Retrieval (CBIR), Image Security,Image Processing,, Secure CBIR, Computer Vision"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Sudheer.jpg",
    "name": "Dr. S Sudheer Mangalampalli",
    "specialization":
        "Specialization Areas: Cloud Computing, Task Scheduling and Workflow Scheduling in Cloud Computing, Edge Computing, Fog Computing, VM Placement mechanisms in cloud computing, Machine Learning and Deep Learning,Computer Networks."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/DR-NAGENDRA-PANINI-CHALLA-Photo.jpg",
    "name": "Dr. Nagendra Panini Challa",
    "specialization":
        "Specialization Areas: Machine Learning, Artificial Intelligence, Image Processing, Internet of Things, Remote Sensing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-Siddique-Ibrahim-Photo.jpg",
    "name": "Dr. Siddique Ibrahim Peer Mohamed",
    "specialization":
        "Specialization Areas: Data Science, Big Data Technologies, Artificial Intelligence, Machine Learning,Recommendation System"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-Selva-kumar-S-Phot.jpg",
    "name": "Dr. Selva Kumar S",
    "specialization":
        "Specialization Areas: Elastic Optical Network (EON), Computer Vision and Image Processing, Optimization Techniques, Data Science and Operating Systems"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Mr-MS-Jagadeesh.jpg",
    "name": "Mr. Jagadeesh M S",
    "specialization":
        "Specialization Areas: Data structures and Algorithms , Graph Theory, Machine Learning, Deep Learning, Soft Computing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-UMAKANTA-NANDA.jpg",
    "name": "Dr. Umakanta NandaDean",
    "specialization":
        "Specialization Areas: Mixed signal VLSI Design, CMOS Analog and RFIC Design, System design using HDL"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-JAGADISH-CHANDRAMUDIGANTI.jpg",
    "name": "Dr. M. Jagadish ChandraDean, Academics",
    "specialization":
        "Specialization Areas: High Power Microwave Sources, Microwave Heating, Passive Microwave Components"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-RAVINDRA-DHULI.jpg",
    "name": "Dr. Ravindra DhuliDean, Academic Research",
    "specialization":
        "Specialization Areas: Image processing, statistical signal processing, biomedical signal processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/pavankumar.jpg",
    "name": "Dr. Y.V. Pavan Kumar",
    "specialization":
        "Specialization Areas: Microgrids, Smart Grids, Classical & Modern Control, Power Quality, Power Converters"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-PURNACHAND-NALLURI.jpg",
    "name": "Dr. N. Purnachand",
    "specialization":
        "Specialization Areas: VLSI System Architecture Design, Digital Video and Image Processing, ASIC and FPGA system design and optimization"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-D.-JOHN-PRADEEP.jpg",
    "name": "Dr. D. John Pradeep",
    "specialization":
        "Specialization Areas: Machine learning, Nonlinear Control, Signal Processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/kalyan.jpg",
    "name": "Mr. M. Kalyan Chakravarthi",
    "specialization":
        "Specialization Areas: Process control and automation, non linear control systems, neural networks, ANFIS"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-GANESH-LAKSHMANKUMAR-MOGANTI.jpg",
    "name": "Mr. M. Ganesh Lakshmana Kumar",
    "specialization":
        "Specialization Areas: Analog VLSI circuits, RF Front-end Circuit, Bio-medical Readout Circuit"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/deepak.jpg",
    "name": "Dr. CH. Deepak",
    "specialization":
        "Specialization Areas: Digital systems, FPGA implementations, IOT, VLSI Circuits"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-ANOOP-KUMAR-MISHRA.jpg",
    "name": "Dr. Anoop Kumar Mishra",
    "specialization":
        "Specialization Areas: Bidirectional relaying system, Non-orthogonal multiple access cooperative network, Molecular communication networks"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/sameulla.jpg",
    "name": "Dr. MD. Sameeulla Khan",
    "specialization":
        "Specialization Areas: Image Processing, Machine Learning, Signal Processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/arun-copy.jpg",
    "name": "Dr. Arun Kumar Sinha",
    "specialization":
        "Specialization Areas: Analog Electronics, Integrated circuit designs, VLSI circuits and simulations"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-DEEPAK-KUMAR-PANDA.jpg",
    "name": "Dr. Deepak Kumar Panda",
    "specialization":
        "Specialization Areas: Microelectronic and VLSI Design, III-V Semiconductor Devices and Heterostructures, Compact Semiconductor Device Modelling"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-JAYENDRA-KUMAR.jpg",
    "name": "Dr. Jayendra Kumar",
    "specialization":
        "Specialization Areas: Microstrip Antennas, Dielectric Resonators, RF & Microwaves"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SUDHA-ELLISON-MATHE.jpg",
    "name": "Dr. Sudha Ellison Mathe",
    "specialization":
        "Specialization Areas: VLSI Architectures, FPGA Design, Digital IC Design"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-NUTHAKKI-VENKATA-RAJASEKAR.jpg",
    "name": "Dr. N. Venkata Rajasekhar",
    "specialization":
        "Specialization Areas:UWB Metamaterial Planar Antennas Design and analysis, Design of Wideband Compact Planar Antennas, Gain Enhancement of compact planar antennas."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-NANDEESH-KUMAR.jpg",
    "name": "Dr. Nandeesh Kumar",
    "specialization":
        "Specialization Areas: Battery Management Systems, IoT, Digital Signal Processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SUNNY-DAYAL.jpg",
    "name": "Dr. Sunny Dayal",
    "specialization":
        "Specialization Areas: Speech Enhancement, Machine Learning, Blind Source Separation, Digital Signal Processing"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/nehagupta.jpg",
    "name": "Dr. Neha Gupta",
    "specialization":
        "Specialization Areas: Remote sensing, Image processing, Machine Learning, Multispectral Image Analysis, Hyperspectral Image Analysis,"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/08/moulana-abdul-kalam.jpg",
    "name": "Dr. Smak Azad",
    "specialization":
        "Specialization Areas: Industrial Automation and Control,Industrial Communication Protocols, Control Area Networks, Embedded Systems, Process Control Systems"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/SAMINENI-PEDDAKRISHNA.jpg",
    "name": "Dr. Samineni Peddakrishna",
    "specialization":
        "Specialization Areas: UWB Antennas, Metamaterial Antennas, Energy harvesting antennas, Reconfigurable Multiband antennas, Embedded Systems"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/chandan.jpg",
    "name": "Dr. Chandan Kumar Pandey",
    "specialization":
        "Specialization Areas: Microelectronics and VLSI design, Tunnel field-effect transistors , Device Modeling, Simulation of advanced CMOS devices for analog/RF applications, Materials characterization for Semiconductor Devices"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/aravid_70157.jpg",
    "name": "Dr. Aravind Kumar Prajapati",
    "specialization":
        "Specialization Areas: Control system Model Order Reduction, Large scale systems, Fault detection and accommodation, Integrated vehicle health management (IVHM)"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/bansal_70160.jpg",
    "name": "Dr. Mohan Bansal",
    "specialization":
        "Specialization Areas: Digital Signal Processing, Speech Signal Processing, Parametric modeling of the signal, Machine Learning, Deep Learning and Reinforcement Learning"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/rohit_70161.jpg",
    "name": "Dr. Rohit Lorenzo",
    "specialization":
        "Specialization Areas: Low Power VLSI Design, CMOS VLSI Design, Memory Design and Digital circuits & System"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/bappaditey_70163.jpg",
    "name": "Dr. Bappadittya Roy",
    "specialization":
        "Specialization Areas:Characterization of Dielectric Material, Microstrip Antenna, Microwave & Millimeter-wave frequencies"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/agam_70164.jpg",
    "name": "Dr. Agam Das Goswami",
    "specialization":
        "Specialization Areas:Multi-Point Stochastic Simulation, Signal Processing, Image Processing & Machine Learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/Lakhan-Dev_70178.jpg",
    "name": "Dr. Lakhan Dev Sharma",
    "specialization":
        "Specialization Areas: Biomedical Signal Processing, Image Processing, Machine Learning"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/01/RajeevSharma70179.jpg",
    "name": "Dr. Rajeev Sharma",
    "specialization":
        "Specialization Areas: Signal Processing, Biomedical Signals Analysis, Artificial Intelligence, Machine Learning, Instrumentation"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/Gurumurthy_70180.jpg",
    "name": "Dr. Gurumurthy Komanapalli",
    "specialization":
        "Specialization Areas: Analog Electronics, Analog VLSI design, CMOS current-mode analog building blocks, Electronic Devices"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Praveen_70181.jpg",
    "name": "Dr. Praveen Kumar",
    "specialization":
        "Specialization Areas: Embedded System, Digital System Design, FPGA, Relay Design, Smart grid & Microgrid, Robotics & Automation"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Suseela_70182.jpg",
    "name": "Dr. Suseela Vappangi",
    "specialization":
        "Specialization Areas: Wireless Communications, Visible Light Communications, Signal Processing for Communication, Free Space Optical Wireless Communications, Next Generation Wireless Communication Systems."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Subhasish_70183.jpg",
    "name": "Dr. Subhasish Mahapatra",
    "specialization":
        "Specialization Areas: Instrumentation & Control, Nonlinear Control, Autonomous Vehicles, Robotics, Process Control Instrumentation"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Prateek_70187.jpg",
    "name": "Dr. Prateek Jain",
    "specialization":
        "Specialization Areas: Real-time system design and implementation, Embedded systems for biomedical applications, CMOS VLSI design, Artificial Intelligence and machine learning, Digital VLSI"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Khairnar_70193.jpg",
    "name": "Dr. Khairnar Vikas Vishnu",
    "specialization":
        "Specialization Areas: RF and Microwave Engineering, Design and Development of Reconfigurable Antennas, Metamaterial Inspired Antennas, mmWave Antenna, Microwave Circuit Design"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Naveen_70195.jpg",
    "name": "Dr. Naveen Cheggoju",
    "specialization":
        "Specialization Areas: Image Processing, Image and Video compression, Computer vision, Machine learning, Face detection and recognition"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Chandu_70196.jpg",
    "name": "Dr. Chandu DS",
    "specialization":
        "Specialization Areas: Design and Measurement of Planar Antennas, Metasurfaces, Microwave and Optical Polarizers, EM Wave Propagation and Microwave Passive Devices"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Chandan-Nayak-Photo.jpg",
    "name": "Dr. Chandan Nayak",
    "specialization":
        "Specialization Areas: Fractional Order Filter Design,Bio-medical Signal Processing,Soft Computing,Internet of Medical Things,Signal Processing for Big Data in Healthcare"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-RAMA-SREEKANTH.jpg",
    "name": "Dr. P.S. Rama Sreekanth Dean",
    "specialization":
        "Specialization Areas: Polymer Nano-composites, Honeycomb sandwich structures, Biomedical materials"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/11/kottareddy.jpg",
    "name": "Dr. S.V. Kota Reddy",
    "specialization":
        "Specialization Areas: Thermal & fluid Engineering (Refrigeration & Air Conditioning)"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-Manivannan.jpg",
    "name": "Dr. Manivannan KDirector Admissions",
    "specialization":
        "Specialization Areas: Automobile Engineering, Manufacturing, Industrial Management"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/dilip.jpg",
    "name": "Dr. Dilip Kumar Mohanty",
    "specialization":
        "Specialization Areas: Thermal Engineering, Heat Transfer, Heat Exchanges"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-PANKAJ-BALAKRISHNA-TAMBE.jpg",
    "name": "Dr. Pankaj Balakrishna Tambe",
    "specialization":
        "Specialization Areas: Materials Processing, Polymer Engineering, Machining Science"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-AMBUJ-SHARMA.jpg",
    "name": "Dr. Ambuj Sharma",
    "specialization":
        "Specialization Areas: Computational Mechanics, Finite Element Analysis, Structural Health Monitoring"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-MANOJ-KUMAR-GUPTA.jpg",
    "name": "Dr. Manoj Kumar Gupta",
    "specialization":
        "Specialization Areas: Tribology, Mineral oils, Dispersants"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-V.-RAVINDRAKUMAR.jpg",
    "name": "Dr. V. Manikanta Ravindra Kumar",
    "specialization":
        "Specialization Areas: Numerical Modelling of Manufacturing Processes, Metal Forming, Railway Engineering"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/manas-pal.jpg",
    "name": "Dr. Manas Kumar Pal",
    "specialization":
        "Specialization Areas: Optical diagnostics, High speed imaging, Image processing, Experimental and numerical investigations of droplet and spray processes, Fuels and combustions"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Suyog-Jhavar.jpg",
    "name": "Dr. Suyog Jhavar",
    "specialization":
        "Specialization Areas: Metal Additive Manufacturing, Welding Engineering, Advanced Manufacturing, Remanufacturing, Surface Engineering"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SANTANU-MANDAL.jpg",
    "name": "Dr. Santanu MandalDean of the School",
    "specialization":
        "Specialization Areas: Artificial Synapses and Neurons, Memristor Based Neural Networks, Memristive Chaotic Dynamics, Image Encryption, Classifications, Nonlinear Dynamical System, Learning Techniques"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-NIKUNJA-BIHARIBARIK.jpg",
    "name": "Dr. Nikunja Bihari Barik Head of the Department",
    "specialization":
        "Specialization Areas: Radial & Integrated Radial Basis Function Method, Partial-Integro Differential Equations"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-B.-SATYANARAYANA.jpg",
    "name": "Dr. Satyanarayana Badeti",
    "specialization":
        "Specialization Areas: Rotating Fluids, Geo Physical Fluid Dynamics, Boundary Layers"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-M.-SUDHAKAR.jpg",
    "name": "Dr. M. Sudhakar",
    "specialization":
        "Specialization Areas: Stochastics for Ocean currents, Fluid dynamics, Numerics of PDE;finite element, finite point set, finite difference and finite volume methods"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-M.-PHANI-KUMAR.jpg",
    "name": "Dr. M. Phani Kumar",
    "specialization":
        "Specialization Areas: Fluid Mechanics, Micropolar, Couple Stress Fluids, CFD"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-S.-SRINIVAS.jpg",
    "name": "Dr. S. Srinivas",
    "specialization":
        "Specialization Areas: Differential Equations, Newtonian and non-Newtonian fluids, Heat Mass transfer"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-VENKATRAJAM-MARKA.jpg",
    "name": "Dr. Venkatrajam Marka",
    "specialization":
        "Specialization Areas: Algebraic Coding Theory, Code-based cryptography, Codes with other Discrete Structures, Applicable Algebra."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-MANOJ-KUMAR-MISHRA.jpg",
    "name": "Dr. Manoj Kumar Mishra",
    "specialization":
        "Specialization Areas: Magnetohydrodynamics, Boundary layer flow, Heat and Mass Transfer"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-VEMULA-RAMAKRISHNA-REDDY.jpg",
    "name": "Dr. Vemula Ramakrishna Reddy",
    "specialization":
        "Specialization Areas: Hydrodynamics, Shear Instability/Stability, Free Surface Flows, Vortex Dynamics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-KOMANDLA-MAHIPAL-REDDY.jpg",
    "name": "Dr. Komandla Mahipal Reddy",
    "specialization":
        "Specialization Areas: Shape Preserving Fractal Interpolation, Geometric Modelling"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/sinuvasan-1.jpg",
    "name": "Dr. R Sinuvasan",
    "specialization":
        "Specialization Areas: Symmetries, Painleve Analysis, Integrability, Lie Algebras, Similarity Transformations"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/shalini-1.jpg",
    "name": "Dr. Shalini",
    "specialization":
        "Specialization Areas: Nonlinear Optimization Problems, Multiobjective mathematical programming, Optimality, Duality"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/ankur.jpg",
    "name": "Dr. Ankur",
    "specialization":
        "Specialization Areas: Algebraic Coding Theory, Combinatorial Coding Theory, Algebraic Number Theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/tanuj.jpg",
    "name": "Dr. Tanuj Kumar",
    "specialization":
        "Specialization Areas: Operator Theory, Integral Transforms, Function spaces"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/lisna_70145.jpg",
    "name": "Dr. Lisna PC",
    "specialization":
        "Specialization Areas:Graph theory, b-coloring, Achromatic Coloring, Injective Coloring, Applications of b-coloring in network analysis"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/kiran_70146.jpg",
    "name": "Dr. Kiran Kumar Patra",
    "specialization":
        "Specialization Areas: Computational fluid dynamics, Free surface dynamics, Non-Newtonian fluid, Finite volume method, Long-wave theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/chandan_70153.jpg",
    "name": "Dr. Chandan Kumar Thakur",
    "specialization":
        "Specialization Areas: Fluid Dynamics, Groundwater Science, Contaminant Hydrology, Porous Media Flow and Transport"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/anilnegi_70156.jpg",
    "name": "Dr. Anil Negi",
    "specialization":
        "Specialization Areas: Geomechanics, Elastodynamics, Piezoelectricity, Fracture Propagation , Solid Mechanics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Pratik_70191.jpg",
    "name": "Dr. Pratik Premadarshi Ray",
    "specialization":
        "Specialization Areas: Cosmology: Modified theories of Gravity, Theoretical Dark   Energy, Tensor Calculus, Differential equation"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Peeyush_70186.jpg",
    "name": "Dr. Peeyush Singh",
    "specialization":
        "Specialization Areas: Numerical Solution of Elastohydrodynamic Lubrication (EHL) theory, modelling and there application in Tribology Engineering, computer Vision, Parallel Computing, Numerical solution of Variational Inequality problems and their applications, Discontinuous Galerkin Finite Element method (DG-FEM), DG-FVM, Spectral Element Method and their error analysis"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Yada_70192.jpg",
    "name": "Dr. Yada Nandukumar",
    "specialization":
        "Specialization Areas: Fluid Dynamics, Rotating Magnetohydrodynamics, Thermodynamics, Computational Fluid Dynamics, Nonlinear Dynamics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Prashanth_70197.jpg",
    "name": "Dr. Prashanth Maroju",
    "specialization":
        "Specialization Areas: Numerical Analysis, Differential equations, Numerical Functional Analysis, Partial Differential equations, Computational Mathematics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Manisha_70198.jpg",
    "name": "Dr. Manisha Maity",
    "specialization":
        "Specialization Areas: Theoretical Seismology, Elastodynamics, Wave Propogation, Continuum Mechanics, Geomechanics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/09/Gaddam-Sharat.jpg",
    "name": "Dr. Gaddam Sharat",
    "specialization":
        "Specialization Areas: Adaptive Finite Element Methods, Discontinuous Galerkin methods, Variational Inequalities, A priori and a posteriori error analysis"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/09/Nadiminti-Nagamani.jpg",
    "name": "Dr. Nadiminti Nagamani",
    "specialization":
        "Specialization Areas:Estimation Theory, Regression Analysis, Decision Theory, Testing of Hypothesis, Probability and Statistics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/09/Rashmi-Dubey.jpg",
    "name": "Dr. Rashmi Dubey",
    "specialization":
        "Specialization Areas: Fluid mechanics, Stability analysis, Porous media flows, Convective heat and mass transfer, Convective instabilities"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/07/Shah-Parth-Mukeshbhai.jpg",
    "name": "Dr. Shah Parth Mukeshbhai",
    "specialization":
        "Specialization Areas: Dynamical Systems, Cosmology, General Relativity, Modified Gravity Theories, Dark Energy and Dark Matter"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/V.jpg",
    "name": "Dr. V. Raja",
    "specialization":
        "Specialization Areas: Graph Theory, Algebraic Graph Theory, Tree-like Graphs, Discrete Structures, Design Theory"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/Aaswathy-R-K-Photo.png",
    "name": "Dr. Aswathy R K",
    "specialization":
        "Specialization Areas: Fractal theory, Fixed point theory, Dynamical systems, Iterated Function Systems, Self-similar sets"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/01/Dr-Ranjan.jpg",
    "name": "Dr. Ranjan Kumar",
    "specialization":
        "Specialization Areas: Fuzzy optimization, Operational Research, Linear Programming Problem, Fuzzy Linear Programming Problem, shortest path problem, numerical analysis"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/70305-Sukanta-Nayak.jpg",
    "name": "Dr.Sukanta Nayak",
    "specialization":
        "Specialization Areas: Numerical Analysis, Uncertainty Analysis, Differential Equations, Interval and Fuzzy Set Theory, Optimization Techniques"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/01/Dr.Ranjeet-kumar-1.jpg",
    "name": "Dr.Ranjeet Kumar Singh",
    "specialization":
        "Specialization Areas: Statistical Process/Quality Control, Statistical Inference, Data Analysis, Distribution Theory, Demography"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Ravi-Kumar.jpg",
    "name": "Dr.Davala Ravi Kumar",
    "specialization":
        "Specialization Areas: Elementary Number Theory, Algebraic Number Theory,Analytic Number Theory"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-N-Rajasekhar.jpg",
    "name": "Dr.N Rajashekar",
    "specialization":
        "Specialization Areas: WEB-Spline based mesh free method, Finite element method, Partial differential equations, Fractional order partial differential equations."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Avadhesh.jpg",
    "name": "Dr.Avadhesh Kumar",
    "specialization":
        "Specialization Areas: Fractional, Delay, Impulsive and Neutral Differential Equations, Controllability of Differential Equations, Natural Language Processing, Stability Theory, Machine Learning"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/05/Francis.jpg",
    "name": "Dr. Francis",
    "specialization":
        "Specialization Areas: b-coloring, Indicated coloring, Domination, Free graphs, Labelling"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/09/Lakshmi-Sowjanya-HOD-Physics.jpg",
    "name": "Dr. Lakshmi Sowjanya PaliHead of the Department",
    "specialization":
        "Specialization Areas: Condensed matter physics, Photovoltaics, Thinfilm Technology"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-N.-MADHUSUDHANA-RAO.jpg",
    "name": "Dr. N. Madhusudhana Rao",
    "specialization":
        "Specialization Areas: Condensed Matter Physics, Dilute Magnetic Semiconductors, Nano materials"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-SK.-KHADHEER-PASHA.jpg",
    "name": "Dr. SK. Khadheer Pasha",
    "specialization":
        "Specialization Areas: Graphene Based Polymer Composites, High-k Dielectrics, Graphene Quantum Dots"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/07/Dr.-ROOPAS-KIRAN.jpg",
    "name": "Dr. S. Roopas Kiran",
    "specialization":
        "Specialization Areas: Ferroelectric and Piezoelectrics, Microwave Processing, Microwave Dielectrics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-J.-SUDHAGAR.jpg",
    "name": "Dr. J. Sudagar",
    "specialization":
        "Specialization Areas: Surface Engineering, Coatings of engineering materials, Corrosion of engineering materials"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/09/VRK-Murthy.jpg",
    "name": "Dr. V.R.K. Murthy(Professor Emeritus)",
    "specialization":
        "Specialization Areas: Electromagnetic fields, Microwave Materials, Characterization and devices, Dielectric, Magnetic materials, Graphite intercalation systems and Applications,Magneto Optic Films and Computational Studies"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-DEBAJIT-GOSWAMI.jpg",
    "name": "Dr. Debajit Goswami",
    "specialization":
        "Specialization Areas: Biophysics, Solid State Physics, Thermodynamics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-MANMADHA-RAO-BANKI.jpg",
    "name": "Dr. B. Manmadha Rao",
    "specialization":
        "Specialization Areas: Gas sensors, Solar cells, Solar fuel generation using nanostructured materials"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/anitha.jpg",
    "name": "Dr. Anita Sagadevan Ethiraj",
    "specialization":
        "Specialization Areas: Quantum dots & Multifunctional Nanomaterials – Synthesis and Applications, Thin Film Technology, Photovoltaics, Polymer nanocomposites"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/nandam-ashok.jpg",
    "name": "Dr. Nandam Ashok",
    "specialization":
        "Specialization Areas: Supercontinuum Generation, Slot optical waveguides, High power fiber lasers, Photonics crystal fibers"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Nagarjuna.jpg",
    "name": "Dr. Nagarjuna Neella",
    "specialization":
        "Specialization Areas: 2D Graphene Materials, Functional Nanostructured Composites, Thin Film Technology, Solution-Processed Electronic Devices, Physical and Mechanical Next-Generation Smart Sensors,  Wearable  Body Warmers, and various Applications."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Prabhakaran-Thandapani.jpg",
    "name": "Dr. Prabhakaran Thandapani",
    "specialization":
        "Specialization Areas: Magnetoelectric polymer nanocomposite films; Ferroelectric polymers; Flexible films; Magnetic nanoparticles; Magnetic refrigeration; Magnetic hyperthermia; Functional materials; Energy and biomedical applications."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Kingshuk-Sarkar.jpg",
    "name": "Dr. Kingshuk Sarkar",
    "specialization":
        "Specialization Areas: Spintronics and Spin Related Mesoscopic Physics,Phenomenology and microscopic theory of conventional and unconventional superconductivity,Klein tunneling and thermoelectricity in Graphene and Dirac materials,Quantum Information and Quantum Computing,Quantum Machine Learning, AI and Data Science and Quantum Finance"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Ganesh-Kotnana.jpg",
    "name": "Dr. Kotnana Ganesh",
    "specialization":
        "Specialization Areas: Magnetic oxides, Multiferroics, Magnetocaloric materials, Magneto-electric coupling, Perovskites"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/M-Venkata-Rajanikanth.jpg",
    "name": "Dr. M Venkata Rajanikanth",
    "specialization":
        "Specialization Areas: Fibre optic sensors engineering, Laser microfabrication of photonic devices, Fibre reinforced composites, Optical instrumentation"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/C-Siva-Kumar-Reddy.jpg",
    "name": "Dr. C Siva Kumar Reddy",
    "specialization":
        "Specialization Areas: Chemical Vapor Deposition growth of 1D, 2D, and 3D Nanomaterials, Mechanical Behavior of Carbon Polymer Nanocomposites, Strain Sensors, Energy harvesting ( Triboelectric nanogenerators), and Processing of polymer composites based on 1D, 2D, and 3D nanomaterials."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-Muhammed-Shafi.jpg",
    "name": "Dr. Muhammed Shafi P",
    "specialization":
        "Specialization Areas: Advanced Material Engineering, Energy Storage/Conversion Applications: Aqueous Zn-ion batteries, Supercapacitor, Photoelectrochemical cell, electrochemical sensor, Hydrogen and Oxygen evolution catalyst, Fuel cell, photocatalytic dye degradation, Applied Physics, etc"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-K-Senthil.jpg",
    "name": "Dr. K Senthil",
    "specialization":
        "Specialization Areas: Metal Oxide Nanomaterials, Metal Oxide-rGO Nanocomposites, Polymer Nanocomposites, Inorganic Phosphor Materials, Photocatalysts, Antibacterial Activities, Supercapacitors, Batteries, Gas Sensors"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/shivan.jpg",
    "name": "Dr. Paramasivam RHead of the Department",
    "specialization":
        "Specialization Areas: Powder Technology, Mineral Processing, Materials Technology, Petrochemicals, Biofuels"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-ANUBENDU-ADHIKARY.jpg",
    "name": "Dr. Anubendu Adhikary",
    "specialization":
        "Specialization Areas: Small molecule activation, Homogeneous catalysis, Energy transportation and conversion, Reductive functionalization ,Reaction kinetics and mechanism"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/selvakumar.jpg",
    "name": "Dr. Selvakumar",
    "specialization":
        "Specialization Areas: Main Group Chemistry, Supramolecular Inorganic Chemistry, Molecular and Material Engineering, Chalcogen Bonding, Biomimetic Catalysis and Electrocatalysis"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/tufan-ghosh.jpg",
    "name": "Dr. Tufan Ghosh",
    "specialization":
        "Specialization Areas: Ultrafast Spectroscopy, Carrier Dynamics in Semiconduction Nanocrystals, Photophysics of Lead Halide Perovskites, Time-Resolved Terahertz Spectroscopy, Vibrational Coherence in Molecules and Solids"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/rajesh.jpg",
    "name": "Dr. Rajesh Chalasani",
    "specialization":
        "Specialization Areas: Magnetic Nanoparticles, Layered materials, Photocatalysis, Hetero-nanostructures, electron holography"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/sabeel_70159.jpg",
    "name": "Dr. Sabeel M Basheer",
    "specialization":
        "Specialization Areas: Transition metals & Lanthanides Coordination Chemistry, Biological Studies of Metal Complexes, Molecular Sensors, Analytical and Electro-analytical Chemistry, Organic-Inorganic Hybrid Materials"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2020/08/Soumyakanta_70176.jpg",
    "name": "Dr. Soumyakanta Prusty",
    "specialization":
        "Specialization Areas: Coordination Chemistry, Supramolecular Chemistry, Complex Architectures and Topology, Mechanically Interlocked Molecules, Systems Chemistry"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Debakanta-Tripathy.jpg",
    "name": "Dr. Debakanta Tripathy",
    "specialization":
        "Specialization Areas: Metal-driven Self-assembly,Supramolecular Chemistry,Crystal Engineering,Molecular Design,Halogen bonding"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dripta-De-Joarder.jpg",
    "name": "Dr. Dripta De Joarder",
    "specialization":
        "Specialization Areas: Total synthesis of biologically active natural products, Development of Asymmetric synthetic methodologies, Design and development of Green catalysts, Peptide chemistry, Synthesis of Novel materials."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Ritambhara-Sharma.jpg",
    "name": "Dr. Ritambhara Sharma",
    "specialization":
        "Specialization Areas: Supramolecular Chemistry, Organic Synthesis, Metal complexed Dyes for Catalytic H2 Evolution and Sensors."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/M-V-V-Srinivasu.jpg",
    "name": "Dr. V V Sreenivasu M",
    "specialization":
        "Specialization Areas: Supramolecular Chemistry, Protein Chemistry, Ion and molecular recognition by using supramolecular scaffolds"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/10/70350-Dr.-Rajneesh-Mishra.jpg",
    "name": "Dr. Rajneesh MishraDean , VISH",
    "specialization":
        "Specialization Areas: Development and Growth, Migration Studies, Managerial Economics, Micro Economics, Macro Economics, Quality Assurance, Institutional Effectiveness, Business Excellence, Higher Education Management"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SUSMITHA-SHYAMSUNDAR.jpg",
    "name": "Dr. Susmitha ShyamsundarAssociate Dean, VISH",
    "specialization":
        "Specialization Areas: ELT, Second Language Acquisition, Phonology"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-R.-THAHIYA-AFZAL.jpg",
    "name": "Dr. R. Thahiya Afzal",
    "specialization":
        "Specialization Areas: Indian writing in English, Food Studies, ELT, ICT"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-RASHEDA-PARVEEN.jpg",
    "name": "Dr. Rasheda Parveen",
    "specialization":
        "Specialization Areas: English in India, Cultural Studies, History of Ideas"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-TANNISTHA-DASGUPTA.jpg",
    "name": "Dr. Tannistha Dasgupta",
    "specialization":
        "Specialization Areas: Language Assessment, Educational Technology,  Second Language Acquisition, Learner Autonomy, Task-based Language Teaching"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Ms.-PRAGYA-SEN-GUPTA.jpg",
    "name": "Dr. Pragya Sen Gupta",
    "specialization":
        "Specialization Areas: Translation Studies, Discourse Analysis, Comparative Literature"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/carlin.jpg",
    "name": "Mr. Carlin Pouamou",
    "specialization":
        "Specialization Areas: Foreign Languages- French & Spanish"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/sudesh-manger.jpg",
    "name": "Dr. Sudesh Manger",
    "specialization":
        "Specialization Areas: Translation Studies, English Literature, History of Nepal, Nepali Literature and Indian Writing in English"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Rakhi.jpg",
    "name": "Dr. Rakhi N.K",
    "specialization":
        "Specialization Areas: Language Technology, Syntax, Corpus Linguistics, NLP, Cognitive Science"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Chandan_70189.jpg",
    "name": "Dr. Chandan Vishwas",
    "specialization":
        "Specialization Areas: French Language & Literature, Francophone Literature & Culture, Canadian French Literature & Culture, Linguistics, Translation Studies"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Raghavi_70194.jpg",
    "name": "Dr. Raghavi R K",
    "specialization":
        "Specialization Areas: Health Humanities, Graphic Medicine, Comics Studies, Literature and Medicine, and Visual Studies"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Vadakkan_70199.jpg",
    "name": "Dr. Vadakkan Neethi Alexander",
    "specialization":
        "Specialization Areas: Anglo-American Fiction, Gothic Studies, Studies in Popular Culture, Literary Theory and Criticism, Postcolonial Literature"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Deepjoy_70201.jpg",
    "name": "Dr. Deepjoy Katuwal",
    "specialization":
        "Literature and Socio-cultural Identities in South Asia, Studies in Eastern Himalayan Literature, Culture and Languages, Postcolonial Literary and Cultural Studies, Indian English Literature, South Asian Language and Literary Studies"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/09/Arenkala-Kichu.jpg",
    "name": "Dr. Arenkala Kichu",
    "specialization":
        "Specialization Areas: English Language Teaching (ELT), English for Specific Purposes (ESP), Second Language Acquisition (SLA), Curriculum & Syllabus Design"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/10/renu_prasad.jpg",
    "name": "Dr. Renuprasad Hemkiran Patki",
    "specialization":
        "Specialization Areas: Didactics of German as a Foreign Language, Contemporary German Poetry, German Love Poetry, Modern German Literature, German into Marathi Literary Translations"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/10/pankaj_kumar.jpg",
    "name": "Dr. Pankaj Kumar",
    "specialization":
        "Specialization Areas: Modern Japanese Literature, Translation Studies, Interpretation, Japanese Management, Japanese Culture and society"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/Kanaka_70185.jpg",
    "name": "Ms. Kanaka Himabindu Pottumuthu",
    "specialization":
        "Specialization Areas: Socio-Cultural Anthropology, Urban Studies, Sustainable & Smart Cities, Ethnography and  Medical Anthropology."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/08/Tania-Chakravarty.jpg",
    "name": "Dr. Tania Chakravarty",
    "specialization":
        "Specialization Areas: Social History of Modern India, Economic History of Modern India, Urban History of Late Nineteenth and Early Twentieth Century India, History of Constitutional Reforms in Early Twentieth Century India, Environmental History of Modern India"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/09/Priyanka-Ghosh.jpg",
    "name": "Dr. Priyanka Ghosh",
    "specialization":
        "Specialization Areas: Political Ecology, Biodiversity Conservation, Protected Area Management, Human-animal Conflicts, Human-Environment Interactions in the Global South"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/12/Dr.Ankita-Swetaparna.jpg",
    "name": "Dr.Ankita Swetaparna",
    "specialization":
        "Specialization Areas: Discourse Analysis, Pragmatics, Phonetics, Second Language Acquisition and Sociolinguistics"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/12/Dr.Nilanjana-Ghosal.jpg",
    "name": "Dr.Nilanjana Ghosal",
    "specialization":
        "Specialization Areas: Religion in Contemporary American Fiction, Contemporary Gothic Studies, Women’s Literature, Feminist Theory, Contemporary American Literature"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Balasingh.jpg",
    "name": "Dr.V Balasingh",
    "specialization":
        "Specialization Areas: British Literature till the 19th century, Postcolonial Literature, Indian Writing in English, Literary Theory and Literary Criticism."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Anindita-Shome.jpg",
    "name": "Ms. Anindita Shome",
    "specialization":
        "Specialization Areas: Migration and Diaspora Literature; South Asian Diaspora; Indian Diaspora Literary and Cultural Studies; Youth Studies; Transnational Literary and Cultural Studies."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Neethudas.jpg",
    "name": "Dr. Neethu Das K",
    "specialization":
        "Specialization Areas: Queer Studies, Theatre Studies,  Women and Writing, Indian English Literature, Culture and Marginality"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Dr-Shubhra-Ghoshal.jpg",
    "name": "Dr. Shubhra Ghoshal",
    "specialization":
        "Specialization Areas: Performative arts,European Drama,Indian Writing in English,Indian Theatre,Literary Theories"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Dheeraj-Kumar.jpg",
    "name": "Mr. Dheeraj Kumar",
    "specialization":
        "Specialization Areas: Swiss-French Literature, French Language & Literature, Translation Studies, French Culture, French Writings on India & Indian Writings in French"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Suresh-Jagannadham.jpg",
    "name": "Dr. Suresh Jagannadham",
    "specialization":
        "Specialization Areas: Contemporary / Modern Hindi Literature, Tribal Discourse of Hindi Literature, Documentation of Tribal Oral Traditions, Arts, Language, Literature and Philosophy of Tribes, Socio,Cultural identity of De-notified, Nomadic and Semi -Nomadic Tribes in India."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Mahi-S-Tharavathu.jpg",
    "name": "Dr. Mahi S Tharavathu",
    "specialization":
        "Specialization Areas: Immigrant Narratives and Contemporary Irish Studies, Global South Studies, Dalit Literature, Ecological Humanities, Mapping the ‘Gothic’ and the ‘Sacred’ in  Space Discourses ."
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/02/Devarati-Roy-Chowdhury.jpg",
    "name": "Dr. Devarati Roy Chowdhury",
    "specialization":
        "Specialization Areas: Food insecurity, livelihood analysis,Gender and Politics,Political Ecology and Political Ethnography,Landscape Governance,Election and Voting Studies"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Ms-Neelima-A.jpg",
    "name": "Ms. Neelima Adapa",
    "specialization":
        "Specialization Areas: Phonetics, English Language Teaching, Black Literature, Language variation, Innovations in ELT."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/05/Sanjit.jpg",
    "name": "Dr. Sanjit Chakraborty",
    "specialization":
        "Specialization Areas: Philosophy of Science, AI and Morality, Philosophy of Language, Philosophy of Mind, Ethics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2021/07/Raghavendra.jpg",
    "name": "Dr. RaghavendraAssociate Dean, VSB",
    "specialization":
        "Specialization Areas: Capital market, Financial Derivatives, Portfolio Management, Financial Management, Management Accounting"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2021/06/Dr.-A.V.V.S.-SUBBA-LAKSHMI-1.jpg",
    "name": "Dr. A.V.V.S. Subba Lakshmi",
    "specialization":
        "Specialization Areas: Microfinance,  Banking Financial services , Corporate Accounting, Personal Finance  & Auditing"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-K.-SAMUEL-JOHNSON.jpg",
    "name": "Mr. K. Samuel Johnson",
    "specialization":
        "Specialization Areas: Educational Technology, Organizational Research and behavior,Human Resource Management"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SALINI-ROSALINE.jpg",
    "name": "Dr. Salini Rosaline",
    "specialization":
        "Specialization Areas: Educational Technology, Human Resource Management, Creativity and Innovation"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/09/usha-1.jpg",
    "name": "Dr. Usha Seshadri",
    "specialization":
        "Specialization Areas: Marketing Analytics, Consumer Behaviour, Services Marketing, Rural Marketing and Digital Marketing."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2019/08/kollapuri.jpg",
    "name": "Dr. Kollapuri M",
    "specialization":
        "Specialization Areas: Econometrics, Money and banking, International economics, Micro and Macro economics"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/01/vikas.jpg",
    "name": "Dr. Vikas Mehra",
    "specialization":
        "Specialization Areas: Business Analytics, Data Visualization, Quantitative Techniques, Operations Management, Supply Chain Management."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/10/nupur_nirola.jpg",
    "name": "Dr. Nupur Nirola",
    "specialization":
        "Specialization Areas: Macroeconomics, Applied Econometrics, Principles of Microeconomics, Public Finance and Role of Institutions in Public Policy"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2022/04/Dr-Nabajyoti-Deka-Photo.jpg",
    "name": "Dr. Nabajyoti Deka",
    "specialization":
        "Specialization Areas: Agricultural Marketing, Agricultural Entrepreneurship, Sustainable Development, Business Economics, Sustainability of Agri-food Systems"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/01/Dr.Benarji-VSL.jpg",
    "name": "Dr. Benarji ChakkaDean, VSL",
    "specialization":
        "Specialization Areas: Public International Law, International Aviation and Space Law, Transitional Justice"
  },
  {
    "img":
        "https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-C.L.V.-SIVA-KUMAR.jpg",
    "name": "Dr. C.L.V. Siva Kumar",
    "specialization":
        "Specialization Areas: Constitution Law, Administrative Law, Interest in law and public Policy"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/07/mahat1.jpg",
    "name": "Ms. M. Mahathi",
    "specialization":
        "Specialization Areas: Criminal Law, Contracts and Family Law"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2020/08/amrita_.jpg",
    "name": "Ms. CH. Amrita Gulshan",
    "specialization":
        "Specialization Areas: International Law, International Trade Law, Space Law, Environmental Law, International Humanitarian Law, Human Rights Law."
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/01/Dr.Alisha-VSL.jpg",
    "name": "Dr.Alisha Pradhan",
    "specialization":
        "Specialization Areas: Family Law, Company Law, Constitutional Law, Law of Torts"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/04/Sneha-VSLMCC.jpg",
    "name": "Ms. M Sneha Goud",
    "specialization":
        "Specialization Areas: Commercial Laws, Technology laws, Data and Privacy Laws, Insolvency and Bankruptcy Laws, Sports Law"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/02/Amit-Kumar-VSL.jpg",
    "name": "Mr. Amit Kumar",
    "specialization":
        "Specialization Areas: Teaching and Research Interest, Business and Human Rights, Public International Law, Human Rights Law, International Humanitarian Law"
  },
  {
    "img": "https://vitap.ac.in/wp-content/uploads/2022/05/Mr-AVIN-TIWARI.jpg",
    "name": "Mr Avin Tiwari",
    "specialization":
        "Specialization Areas: Corporate Law, Taxation, Competition Law, Banking & Insurance Laws, International Trade & Investment Laws"
  }
];

class IndividualFaculty {
  String img;
  String name;
  String specializations;

  IndividualFaculty(this.img, this.name, this.specializations);

  @override
  String toString() {
    return 'IndividualFaculty{\n\t img: $img,\n\t name: $name, \n\t specializations: $specializations \n}';
  }
}

class Faculty {
  List<IndividualFaculty> facultyList;
  Faculty(this.facultyList);
  factory Faculty.fromJson(data) {
    List<IndividualFaculty> _facultyList = [];
    for (var faculty in data) {
      _facultyList.add(IndividualFaculty(
          faculty['img'], faculty['name'], faculty['specialization']));
    }
    return Faculty(_facultyList);
  }

  List<IndividualFaculty> getFaculty() => facultyList;
}
